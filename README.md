# Docker container
This repository provides an example of how to create a Docker image and run a Docker container. The repository contains a Dockerfile, a shell script to build the Docker image, and a shell script to run the Docker container.


## Introduction

Docker is a platform for building, shipping, and running applications in containers. Containers are lightweight, portable, and self-sufficient, making them an ideal choice for running applications in a variety of environments.

This repository provides an example of how to use Docker to build and run a containerized application.

## Description of Files:
-  **Dockerfile :** Instructions required to build a docker image from a base image.

    Some common instructions that can be included in a Dockerfile are:

    - **FROM**: specifies the base image that the new image should be built from
    - **WORKDIR**: sets the working directory for any subsequent instructions
    - **RUN**: executes a command inside the container during the build process
    - **COPY** or **ADD**: copies files from the host machine into the container
    - **CMD** or **ENTRYPOINT**: specifies the command that should be run when the container is started

- **build-image-local.sh :**: This shell script automates the process of building a Docker image from a Dockerfile. The script uses the **`docker build`** command to build the Docker image and provides additional configuration options. For example, you can specify a GitHub access token to download private dependencies during the build process.

- **run-container.sh :** This shell script automates the process of running a Docker container from a Docker image. The script uses the **`docker run`** command to run the Docker container and provides additional configuration options. For example, you can specify the name of the container and the command to run inside the container.

## Examples
To build the docker image

``` 
./build-image-local.sh
```

This will build the Docker image using the instructions in the Dockerfile and any additional configuration options specified in `build-image-local.sh`.

To run the Docker container:

```
./run-container.sh
```
This will run the Docker container using the Docker image created by `build-image-local.sh` and any additional configuration options specified in `run-container.sh`.

---

## Common Docker Commands

- **docker pull**: Pulls a Docker image from a Docker registry
- **docker build**: Builds a Docker image from a Dockerfile
- **docker run**: Runs a Docker container from a Docker image
- **docker ps**: Lists all running Docker containers
- **docker stop**: Stops a running Docker container
- **docker rm**: Removes a stopped Docker container
- **docker rmi**: Removes a Docker image
- **docker exec**: Runs a command inside a running Docker container
- **docker logs**: Displays the logs of a running Docker container

### Here are some examples of how to use these commands:

**To pull a Docker image**
```
docker pull image_name:tag
```

This will pull the Docker image with the specified name and tag from a Docker registry, such as Docker Hub.

**To build a Docker image:**
```
docker build -t image_name:tag .
```

This will build a Docker image with the specified name and tag using the Dockerfile in the current directory (.).

**To run a Docker container:**
```
docker run -it --name container_name image_name:tag
```
This will run a Docker container with the specified name using the Docker image with the specified name and tag. The -it option tells Docker to allocate a pseudo-TTY and keep STDIN open, and the --name option specifies the name of the container.

**To stop a running Docker container:**
```
docker stop container_name
```
This will stop the running Docker container with the specified name.

**To remove a stopped Docker container:**
```
docker rm container_name
```
This will remove the stopped Docker container with the specified name.

**To remove a Docker image:**
```
docker rmi image_name:tag
```
This will remove the Docker image with the specified name and tag.

**To run a command inside a running Docker container:**
```
docker exec -it container_name command
```
This will run the specified command inside the running Docker container with the specified name.

**To display the logs of a running Docker container:**
```
docker logs container_name
```
This will display the logs of the running Docker container with the specified name.


## Resources
Here are some resources to help you learn more about Docker:

[Docker documentation](https://docs.docker.com/)
