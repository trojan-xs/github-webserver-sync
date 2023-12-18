#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <GitHub Repo Link> <Global Path to Directory>"
    exit 1
fi

# Assign arguments to variables
github_repo="$1"
directory_path="$2"

# Check if the directory exists
if [ -d "$directory_path" ]; then
    # Directory exists, delete its contents
    echo "Directory exists. Deleting contents..."
    find "$directory_path" -mindepth 1 -delete
else
    # Directory does not exist, create it
    echo "Creating directory..."
    mkdir -p "$directory_path"
fi

# Clone the GitHub repo into the directory
echo "Cloning GitHub repo into the directory..."
git clone "$github_repo" "$directory_path"

echo "Process completed successfully."

