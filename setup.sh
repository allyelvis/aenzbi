#!/bin/bash

# Aenzbi Setup Script
echo "Starting Aenzbi setup..."

# Check if Node.js is installed
if ! [ -x "$(command -v node)" ]; then
  echo "Node.js is not installed. Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  echo "Node.js is already installed."
fi

# Check if Git is installed
if ! [ -x "$(command -v git)" ]; then
  echo "Git is not installed. Installing Git..."
  sudo apt-get install -y git
else
  echo "Git is already installed."
fi

# Clone the Aenzbi repository
if [ ! -d "aenzbi" ]; then
  echo "Cloning Aenzbi repository..."
  git clone https://github.com/allyelvis/aenzbi.git
else
  echo "Repository already cloned. Pulling latest changes..."
  cd aenzbi
  git pull
  cd ..
fi

# Navigate to the project directory
cd aenzbi || exit

# Install dependencies
echo "Installing dependencies..."
npm install

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
  echo "Creating .env file..."
  cat <<EOT >>.env
API_BASE_URL=https://ebms.obr.gov.bi:9443/ebms_api
BEARER_TOKEN=your_token_here
PORT=3000
EOT
  echo ".env file created. Please update it with your credentials."
else
  echo ".env file already exists."
fi

# Complete
echo "Setup is complete. Run 'npm start' to launch the application."