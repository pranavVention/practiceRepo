# Remove old container with same name
echo "Removing old container..."
docker rm  ros2-humble-container

# add non-network local connections to access control list:
xhost +local:


# Run container
docker  run -it \
        --privileged \
        --net=host \
        --ulimit nofile=1024:524288 \
        --name="ros2-humble-container" \
        --expose=9091 -p 9091:9091 \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --env=NVIDIA_VISIBLE_DEVICES=all \
        --env=NVIDIA_DRIVER_CAPABILITIES=all \
        ros2-humble-image\
        zsh