#!/bin/bash

# AWS EC2 Deployment Script
echo "Starting deployment to AWS EC2..."

# Variables
DOCKER_IMAGE="rishi0655/mentor-baba-quiz-app:latest"
CONTAINER_NAME="quiz-app"

# Stop and remove existing container
echo "Stopping existing container..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Pull latest image
echo "Pulling latest Docker image..."
docker pull $DOCKER_IMAGE

# Run new container
echo "Starting new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 80:5000 \
  --restart unless-stopped \
  $DOCKER_IMAGE

echo "Deployment completed successfully!"
echo "Application is running on http://your-ec2-ip"