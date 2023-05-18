TOKEN_PATH="../TOKEN.txt"
PAT=$(cat $TOKEN_PATH)
if [[ "" == "$PAT" ]]; then
	echo >&2 "No GitHub access token found at $TOKEN_PATH"
	exit 1
fi

echo "Building image from Dockerfile..."
docker build --no-cache . --build-arg GIT_PAT=$PAT -t ros-noetic-image 


