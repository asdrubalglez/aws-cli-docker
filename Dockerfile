# Use the official AWS CLI Docker image as the base image
FROM amazon/aws-cli:latest

# Install Node.js and npm
RUN yum install -y curl
RUN curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
RUN yum install -y glibc nodejs

# Verify installation
RUN node --version
RUN npm --version

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]

# Make the script executable
RUN chmod +x /entrypoint.sh

