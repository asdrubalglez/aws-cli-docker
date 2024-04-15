#!/bin/sh
set -e

# Parse input arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --ignore-errors)
            IGNORE_ERRORS=true
            shift
            ;;
        *)
            AWS_COMMAND_ARGS+=("$1")
            shift
            ;;
    esac
done

# Run the AWS CLI command and capture output
aws_output=$(aws "${AWS_COMMAND_ARGS[@]}" 2>&1) || true

# Set the output to the GITHUB_OUTPUT environment variable
echo "GITHUB_OUTPUT=$aws_output" >> $GITHUB_ENV

# Check if errors should be ignored
if [ "$IGNORE_ERRORS" = true ]; then
    exit 0
fi

# Exit with the exit code of the AWS CLI command
if [ -n "$aws_output" ]; then
    echo "$aws_output" >&2
    exit 1
fi
exit 0
