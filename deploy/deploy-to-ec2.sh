#!/bin/bash

# EC2 Deployment Script
echo "Starting deployment..."

# Pull latest image
docker pull $DOCKER_REGISTRY/$DOCKER_IMAGE:latest

# Stop existing container
docker stop quiz-app || true
docker rm quiz-app || true

# Run new container
docker run -d \
  --name quiz-app \
  -p 80:5000 \
  --restart unless-stopped \
  $DOCKER_REGISTRY/$DOCKER_IMAGE:latest

echo "Deployment completed!"