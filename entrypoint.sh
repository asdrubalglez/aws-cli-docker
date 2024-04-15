#!/bin/sh
set -e

# Run the AWS CLI command and capture output
aws_output=$(aws "$@")

# Set the output to the GITHUB_OUTPUT environment variable
echo "GITHUB_OUTPUT=$aws_output" >>$GITHUB_ENV

# Exit with the exit code of the AWS CLI command
exit $?
