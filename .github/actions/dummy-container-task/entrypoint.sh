#!/bin/bash
set -e # Fail fast if any command errors

# $1 is the first argument defined in action.yml 'args'
TARGET_NAME=$1

echo "Hello, $TARGET_NAME! I am running inside a custom Docker container."

# Check if a specific tool we installed exists
echo "Checking jq version:"
jq --version

# Perform complex logic...
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

# Set an output for the workflow to use later
echo "memory=$MEMORY_USAGE" >> "$GITHUB_OUTPUT"