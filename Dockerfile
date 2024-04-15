# Use the official Node.js Docker image as the base image
FROM node:20

# Install AWS CLI
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  python3 \
  python3-pip \
  groff \
  less \
  && pip3 install --upgrade awscli

# Verify AWS CLI installation
RUN aws --version

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]

# Make the script executable
RUN chmod +x /entrypoint.sh

