Docker image for compiling gstreamer from git

Based upon https://hub.docker.com/r/davibe/gstreamer-docker/~/dockerfile/ tailored for my use - work in progress...

Build the container with:

docker-compose Build

Run the container with 

docker_run.sh

from inside the container run the build_gstreamer.sh script