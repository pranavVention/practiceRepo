#!/bin/bash

BUILT_IMAGE="ros-noetic-image-built"
DOCKERHUB_REPO="ghcr.io/pranavvention/practicegit"
DOCKERHUB_TAG="ros-noetic-image-built:latest"

# Tag the image
echo "Tagging image..."
docker tag "$BUILT_IMAGE" "$DOCKERHUB_REPO/$DOCKERHUB_TAG" || { echo "Error: Failed to tag image"; exit 1; }

# Push the image to Docker Hub (GitHub Container Registry)
echo "Pushing image to Docker Hub..."
docker push "$DOCKERHUB_REPO/$DOCKERHUB_TAG" || { echo "Error: Failed to push image to Docker Hub"; exit 1; }

# Remove the locally tagged image
echo "Removing local image..."
docker image rm "$DOCKERHUB_REPO/$DOCKERHUB_TAG" || { echo "Error: Failed to remove local image"; exit 1; }

echo "Image push complete!"
