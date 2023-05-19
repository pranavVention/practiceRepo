TOKEN_PATH="../TOKEN.txt"
PAT=$(cat $TOKEN_PATH)
if [[ "" == "$PAT" ]]; then
	echo >&2 "No GitHub access token found at $TOKEN_PATH"
	exit 1
fi

BASE_IMAGE="ros-noetic-image"
BUILT_IMAGE="ros-noetic-image-built"

echo "Building image from Dockerfile..."
echo "First DOCKER Build"
docker build --no-cache . --build-arg GIT_PAT="$PAT" -t "$BASE_IMAGE" || { echo "Error: Docker build failed"; exit 1; }

echo "Second DOCKER Build"
docker build --no-cache . --file Linux.Dockerfile --build-arg GIT_PAT="$PAT" -t "$BUILT_IMAGE" || { echo "Error: Docker build failed"; exit 1; }


DANGLING_IMAGES=$(docker images -f "dangling=true" -q)
if [[ -n "$DANGLING_IMAGES" ]]; then
	echo "Remove dangling images"
    docker rmi -f $DANGLING_IMAGES || { echo "Error: Failed to remove dangling images"; exit 1; }
fi
echo "Remove $BASE_IMAGE"
docker rmi -f "$BASE_IMAGE" || { echo "Error: Failed to remove $BASE_IMAGE"; exit 1; }

