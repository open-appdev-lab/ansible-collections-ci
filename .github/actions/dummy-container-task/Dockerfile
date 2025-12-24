# Start from a slim base image (or use ubuntu:latest, python:3.9, etc.)
FROM alpine:3.17

# Install any dependencies your script needs
RUN apk add --no-cache bash curl jq

# Copy your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]