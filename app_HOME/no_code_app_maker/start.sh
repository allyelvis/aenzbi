#!/bin/bash

# Start backend
echo "Starting backend..."
cd backend
npm start &

# Start frontend
echo "Starting frontend..."
cd ../frontend
npm run dev
