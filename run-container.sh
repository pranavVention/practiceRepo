# Remove old container with same name
echo "Removing old container..."
docker rm  ros2-humble-container

# Run container
docker  run -it \
        --name="ros2-humble-container" \
        ros2-humble-image\
        zsh