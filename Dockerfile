# Use the official AWS CLI Docker image as the base image
FROM amazon/aws-cli:latest

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/entrypoint.sh"]

# Make the script executable
RUN chmod +x /entrypoint.sh

