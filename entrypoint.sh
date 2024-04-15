# #!/bin/sh
# set -e

# # Run the AWS CLI command and capture output
# aws_output=$(aws "$@")

# # Set the output to the GITHUB_OUTPUT environment variable
# echo "GITHUB_OUTPUT=$aws_output" >>$GITHUB_ENV

# # Exit with the exit code of the AWS CLI command
# exit $?

#!/bin/sh
set -e

# Run the AWS CLI command and capture output
aws "$@" > /tmp/aws_output.txt

# Set the output to the GITHUB_OUTPUT environment variable
echo "GITHUB_OUTPUT=$(cat /tmp/aws_output.txt)" >> $GITHUB_ENV

# Cleanup
rm /tmp/aws_output.txt
