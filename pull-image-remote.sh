DOCKERHUB_REPO="ghcr.io/pranavvention/practicegit"
DOCKERHUB_IMAGE="ros-noetic-image-built"
TAG="latest"

IMAGE_NAME="$DOCKERHUB_REPO/$DOCKERHUB_IMAGE:$TAG"
TARGET_IMAGE="ros-noetic-image-built"

echo "Pulling image $IMAGE_NAME..."
docker pull "$IMAGE_NAME" || { echo "Error: Failed to pull image $IMAGE_NAME"; exit 1; }

echo "Tagging image $IMAGE_NAME as $TARGET_IMAGE..."
docker tag "$IMAGE_NAME" "$TARGET_IMAGE" || { echo "Error: Failed to tag image $IMAGE_NAME as $TARGET_IMAGE"; exit 1; }

docker image rm "$IMAGE_NAME"

echo "Image pull complete!"
