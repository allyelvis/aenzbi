#!/usr/bin/env bash

set -e

echo "== Project Auto Installer =="

# Detect project root
ROOT_DIR="$(pwd)"
README="$ROOT_DIR/README.md"

if [ ! -f "$README" ]; then
  echo "README.md not found in current directory"
  exit 1
fi

echo "Reading README.md..."

# Detect stack
if [ -f "package.json" ]; then
  STACK="node"
elif [ -f "requirements.txt" ] || grep -qi "python" "$README"; then
  STACK="python"
elif [ -f "pubspec.yaml" ]; then
  STACK="flutter"
elif [ -f "go.mod" ]; then
  STACK="go"
elif [ -f "composer.json" ]; then
  STACK="php"
else
  STACK="unknown"
fi

echo "Detected stack: $STACK"

install_node() {
  echo "Installing Node dependencies..."
  npm install
  if grep -qi "dev" package.json; then
    echo "Starting Node dev server..."
    npm run dev || npm start
  else
    npm start
  fi
}

install_python() {
  echo "Setting up Python environment..."
  python3 -m venv venv
  source venv/bin/activate
  pip install --upgrade pip

  if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
  fi

  if grep -qi "flask" "$README"; then
    echo "Starting Flask app..."
    python app.py || python main.py
  elif grep -qi "django" "$README"; then
    echo "Starting Django server..."
    python manage.py runserver 0.0.0.0:8000
  else
    echo "Running Python main file..."
    python main.py || python app.py
  fi
}

install_flutter() {
  echo "Installing Flutter dependencies..."
  flutter pub get
  flutter run
}

install_go() {
  echo "Running Go project..."
  go mod tidy
  go run .
}

install_php() {
  echo "Installing PHP dependencies..."
  if command -v composer &> /dev/null; then
    composer install
  fi
  php -S 0.0.0.0:8000
}

case "$STACK" in
  node) install_node ;;
  python) install_python ;;
  flutter) install_flutter ;;
  go) install_go ;;
  php) install_php ;;
  *)
    echo "Unknown stack. Please run manually."
    exit 1
    ;;
esac
