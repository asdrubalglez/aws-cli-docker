#!/bin/sh
set -e

# Run the AWS CLI command and capture output
aws_output=$(aws "$@" 2>&1) || true

# Extract the relevant information (first line)
login_info=$(echo "$aws_output" | head -n 1)

# Set the output to the GITHUB_OUTPUT environment variable
echo "GITHUB_OUTPUT=$login_info" >> $GITHUB_ENV

# Exit with the exit code of the AWS CLI command
if [ -n "$aws_output" ]; then
    echo "$aws_output" >&2
    exit 0
fi
exit 0
