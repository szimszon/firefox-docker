#!/bin/bash

# Docker image name
DOCKER_IMAGE="szimszon/firefox:v2"
# Running Docker container name
DOCKER_NAME="firefox-docker"
# PulseAudio server address (listen on Docker main IP)
PULSE_SERVER="172.17.42.1:4713"
#Original user'S download directory
ORIGINAL_DOWNLOADS="$HOME/Downloads/$DOCKER_NAME"

# Stop and remove docker container if exist
if docker ps -a | grep " $DOCKER_NAME " | cut -d\  -f1; then
  docker stop "$DOCKER_NAME"
  sleep 0.5
  docker rm "$DOCKER_NAME"
  sleep 0.5
fi

# Make Downloads directory for container
if ! [ -e "$ORIGINAL_DOWNLOADS" ]; then
  mkdir -p "$ORIGINAL_DOWNLOADS="
fi

# Run firefox container
           # Link container Downloads directory to $HOME's (Hungarian)
           # Make X work
           # Remove container if ENTRYPOINT script exits
           # Delegate real user UID and GID number to container firefox user
           # Set X DISPLAY
           # Set PulseAudio server
           # Name Docker container
           # Set which image to make container from
docker run -v $ORIGINAL_DOWNLOADS:/home/firefox/Downloads:rw \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --rm=true \
           -e uid=$(id -u) -e gid=$(id -g) \
           -e DISPLAY=unix$DISPLAY \
           -e PULSE_SERVER="$PULSE_SERVER" \
           --name $DOCKER_NAME \
           $DOCKER_IMAGE

