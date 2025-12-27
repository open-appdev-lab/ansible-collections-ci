# Start from a slim base image (or use ubuntu:latest, python:3.9, etc.)
FROM docker.io/python:3.14-slim-trixie

# Install any dependencies your script needs
RUN python3 -m pip install ansible-core python-semantic-release docsible

# Copy your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]