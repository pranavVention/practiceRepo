FROM ros-noetic-image  as ros-noetic-image-built
RUN catkin build

# add sourcing the catkin workspace to .zshrc
RUN echo 'source ~/workspace/devel/setup.zsh' >> ~/.zshrc
