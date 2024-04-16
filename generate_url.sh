#!/bin/bash

# Detect the architecture
ARCH=$(uname -m)

# Construct the URL based on the architecture
if [ "$ARCH" = "x86_64" ]; then
    URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
elif [ "$ARCH" = "aarch64" ]; then
    URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

echo "$URL"
