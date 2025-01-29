#!/bin/bash

# Set project details
PROJECT_NAME="aenzbi-suite"
GCP_PROJECT_ID="aenzbi-suite-$(date +%s)" # Unique project ID
GITHUB_REPO="aenzbi-suite-app"
PACKAGE_NAME="com.aenzbi.app"
IOS_BUNDLE_ID="com.aenzbi.ios"
GITHUB_USERNAME="YOUR_GITHUB_USERNAME"  # Update with your GitHub username
IOS_TEAM_ID="YOUR_APPLE_TEAM_ID"  # Update with your Apple Developer Team ID

echo "🚀 Setting up Aenzbi Suite project..."

# 1️⃣ Create Google Cloud Project
echo "🔹 Creating Google Cloud Project: $PROJECT_NAME..."
gcloud projects create $GCP_PROJECT_ID --set-as-default
gcloud config set project $GCP_PROJECT_ID

# 2️⃣ Enable Required APIs
echo "🔹 Enabling required Google Cloud APIs..."
gcloud services enable \
  cloudresourcemanager.googleapis.com \
  iam.googleapis.com \
  run.googleapis.com \
  firestore.googleapis.com \
  firebase.googleapis.com \
  firebasehosting.googleapis.com \
  cloudbuild.googleapis.com \
  androidpublisher.googleapis.com

# 3️⃣ Initialize Firebase Project
echo "🔹 Initializing Firebase project..."
firebase projects:create $GCP_PROJECT_ID --display-name "$PROJECT_NAME"
firebase use --add $GCP_PROJECT_ID

# 4️⃣ Setup Firestore, Auth, Storage
echo "🔹 Setting up Firebase Firestore, Authentication, and Storage..."
firebase firestore:enable
firebase auth:enable
firebase storage:enable

# 5️⃣ Enable Firebase Authentication Methods
echo "🔹 Enabling Firebase authentication methods..."
firebase auth:update --set-email-signin-enabled
firebase auth:update --set-phone-signin-enabled
firebase auth:update --set-google-signin-enabled

# 6️⃣ Create Backend (Django) with Cloud Run
echo "🔹 Setting up Django backend..."
mkdir -p backend && cd backend
python3 -m venv venv
source venv/bin/activate
pip install django gunicorn firebase-admin psycopg2-binary

# Initialize Django Project
django-admin startproject aenzbi
cd aenzbi

# Create Dockerfile for Cloud Run
cat <<EOF > Dockerfile
FROM python:3.10
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["gunicorn", "-b", "0.0.0.0:8000", "aenzbi.wsgi"]
EOF

# Deploy to Cloud Run
gcloud builds submit --tag gcr.io/$GCP_PROJECT_ID/aenzbi-api
gcloud run deploy aenzbi-api --image gcr.io/$GCP_PROJECT_ID/aenzbi-api --platform managed --region us-central1 --allow-unauthenticated
BACKEND_URL=$(gcloud run services describe aenzbi-api --region us-central1 --format 'value(status.url)')
echo "✅ Backend deployed at: $BACKEND_URL"
cd ../..

# 7️⃣ Create Flutter App
echo "🔹 Setting up Flutter Android & iOS app..."
flutter create aenzbi_app
cd aenzbi_app

# Add Firebase to Flutter
echo "🔹 Adding Firebase dependencies..."
flutter pub add firebase_core firebase_auth cloud_firestore firebase_analytics provider http

# Download google-services.json for Android
firebase apps:create android --package-name $PACKAGE_NAME
firebase apps:sdkconfig android > google-services.json
mv google-services.json android/app/

# Download GoogleService-Info.plist for iOS
firebase apps:create ios --bundle-id $IOS_BUNDLE_ID --team-id $IOS_TEAM_ID
firebase apps:sdkconfig ios > GoogleService-Info.plist
mv GoogleService-Info.plist ios/Runner/

# 8️⃣ Setup GitHub Repository
echo "🔹 Setting up GitHub repository..."
gh repo create $GITHUB_USERNAME/$GITHUB_REPO --public --source=.
git init
git add .
git commit -m "Initial commit - Aenzbi Suite App"
git branch -M main
git remote add origin https://github.com/$GITHUB_USERNAME/$GITHUB_REPO.git
git push -u origin main

# 9️⃣ Set Up CI/CD with GitHub Actions (Android & iOS)
echo "🔹 Setting up GitHub Actions for automatic builds..."
mkdir -p .github/workflows
cat <<EOF > .github/workflows/flutter-build.yml
name: Flutter Android & iOS Build

on:
  push:
    branches:
      - main

jobs:
  android_build:
    name: Build Flutter APK
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.x"

      - name: Install Dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --release

      - name: Upload APK as Artifact
        uses: actions/upload-artifact@v3
        with:
          name: app-release-apk
          path: build/app/outputs/flutter-apk/app-release.apk

  ios_build:
    name: Build Flutter iOS App
    runs-on: macos-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: "3.x"

      - name: Install Dependencies
        run: flutter pub get

      - name: Build iOS App
        run: flutter build ios --release --no-codesign
EOF
git add .github/workflows/flutter-build.yml
git commit -m "Added GitHub Actions for Flutter Android & iOS build"
git push origin main

# 1️⃣0️⃣ Build & Deploy Flutter App
echo "🔹 Building Flutter Android & iOS apps..."
flutter build apk --release
flutter build ios --release --no-codesign

# 1️⃣1️⃣ Upload APK to Google Play Console
echo "🔹 Uploading APK to Google Play Console..."
gcloud auth login
gcloud auth application-default login
gcloud --quiet auth configure-docker

gcloud beta android-publisher uploads apks upload \
  --package-name=$PACKAGE_NAME \
  --apk=build/app/outputs/flutter-apk/app-release.apk \
  --track=internal

echo "✅ Setup complete! APK uploaded to Google Play Console."
