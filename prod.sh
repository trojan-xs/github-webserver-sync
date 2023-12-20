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
    # Directory exists, navigate to it
    cd "$directory_path" || exit

    # Use git to fetch and apply changes
    echo "Updating existing repository..."
    git fetch --all
    git reset --hard origin/main  # Change 'main' to your branch if different
    git pull origin main  # Change 'main' to your branch if different
else
    # Directory does not exist, clone the GitHub repo
    echo "Creating directory and cloning GitHub repo..."
    git clone "$github_repo" "$directory_path"
fi

echo "Process completed successfully."

