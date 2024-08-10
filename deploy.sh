#!/bin/bash

# Exit the script if any command fails
set -e

# Function to build Docker images
build_image() {
    local image_name=$1
    local context_dir=$2
    echo "Building Docker image: ${image_name}"
    docker build -t ${image_name} ${context_dir}
}

# Build the frontend Docker image
build_image "frontend:latest" "./frontend"

# Build the backend Docker image
build_image "backend:latest" "./backend"

# Deploy the containers
echo "Deploying frontend and backend containers"

# Run the frontend container
docker run -d -p 80:80 frontend:latest

# Run the backend container
docker run -d -p 3000:3000 backend:latest

echo "Deployment complete."
