#!/bin/sh
set -e

# Run the command and send output to stdout
exec aws "$@" 2>&1
