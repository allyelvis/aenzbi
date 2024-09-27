#!/bin/bash
# Simple script to query ChatGPT for assistance

if [ -z "$1" ]; then
  echo "Please provide a prompt for ChatGPT."
  exit 1
fi

# OpenAI API call
response=$(curl -s https://api.openai.com/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your_openai_api_key" \
  -d '{
  "model": "text-davinci-003",
  "prompt": "'""'",
  "temperature": 0.7,
  "max_tokens": 150
}')

echo "ChatGPT Response:"
echo "$response"
