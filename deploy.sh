#!/bin/bash

# -----------------------------
# UAT/Prod Deployment Script
# -----------------------------

# Exit immediately if a command fails
set -e

# Go to the project directory
cd ~/user-management

echo "✅ Pulling latest code from GitHub..."
git fetch --all
git reset --hard origin/develop   # UAT branch, change to 'main' for Prod

echo "✅ Stopping current containers..."
docker-compose down

echo "✅ Building and starting containers..."
docker-compose up -d --build

echo "✅ Deployment complete! 🟢"
