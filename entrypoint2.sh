#!/bin/sh
set -e

# Run the AWS CLI command
aws "$@" >/tmp/aws_output.txt

# Capture stdout and set it to the GITHUB_OUTPUT environment variable
echo "GITHUB_OUTPUT=$(cat /tmp/aws_output.txt)" >>$GITHUB_ENV

# Cleanup
rm /tmp/aws_output.txt

# Exit
exit $