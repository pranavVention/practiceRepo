# https://varhowto.com/install-ros-noetic-docker/
# https://www.ros.org/reps/rep-0142.html
FROM osrf/ros:noetic-desktop-full as neotic-base-image
# WORKDIR /home
# go to workspace

LABEL version="1.0"
LABEL maintainer="Pranav Jain"

WORKDIR /root/workspace


# Install Catkin and Tools
RUN apt update \
  && apt-get install ros-$ROS_DISTRO-catkin \
  # https://stackoverflow.com/questions/41234957/catkin-command-not-found
  && apt install python3-catkin-tools -y \
  && apt install python3-osrf-pycommon\ 
  # Install Tools
  && apt install vim -y\
  && apt install python3-pip -y\
  && pip3 install --upgrade pip\
  && apt install htop -y\
  # Install zsh
  && apt install -y zsh \
  && apt install -y wget \
  && sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
  -t robbyrussell

# Cleanup
RUN apt clean \ 
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*


#Update ROS dependencies
RUN rosdep update

# source global ros
# RUN echo 'source /opt/ros/$ROS_DISTRO/setup.zsh' >> /root/.zshrc
ENTRYPOINT ["zsh", "-c", "source /opt/ros/$ROS_DISTRO/setup.zsh && exec zsh"]


#Git PAT to clone private repos
ARG GIT_PAT
RUN mkdir src
#Clone GIT REPO HERE and pass PAT
# RUN git clone https://${GIT_PAT}:<SSH Link here> src/folder

# install ROS package dependencies
RUN rosdep install --from-paths ./src --ignore-src -y --rosdistro=$ROS_DISTRO

# build catkin workspace
RUN catkin config --extend /opt/ros/$ROS_DISTRO

#Copy local files or folder to container
COPY ./README.md /home

