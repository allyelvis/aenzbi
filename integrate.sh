#!/bin/bash

# Aenzbi Integration Script
echo "Starting Aenzbi integration setup..."

# Check if curl is installed
if ! [ -x "$(command -v curl)" ]; then
  echo "curl is not installed. Installing curl..."
  sudo apt-get install -y curl
else
  echo "curl is already installed."
fi

# Set the endpoint URL
NEW_API_URL="https://ep-steep-hall-a4jlheao-pooler.us-east-1.aws.neon.tech"

# Function to integrate with the endpoint
integrate_with_endpoint() {
  local data=$1

  # Make the HTTP POST request to the endpoint
  response=$(curl -s -w "%{http_code}" -o /dev/null -X POST "$NEW_API_URL/your-endpoint" -H "Content-Type: application/json" -d "$data")

  # Check if the request was successful
  if [ "$response" -eq 200 ]; then
    echo "Integration with endpoint was successful."
  else
    echo "Failed to integrate with endpoint. HTTP status code: $response"
  fi
}

# Example data to send
data='{"key": "value"}'

# Call the function to integrate with the endpoint
integrate_with_endpoint "$data"

echo "Integration setup complete."
