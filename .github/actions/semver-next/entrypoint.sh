#!/bin/bash
set -e # Fail fast if any command errors

# Perform complex logic...
NEXT_VERSION="$(semantic-release version --print-tag)"

# Set an output for the workflow to use later
echo "next-version=$NEXT_VERSION" >> "$GITHUB_OUTPUT"