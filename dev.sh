#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <github_repository> <directory_name>"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign input parameters to variables
github_repository="$1"
directory_name="$2"

# Check if the directory already exists
if [ -d "$directory_name" ]; then
    # Rename the existing directory with the current date
    current_date=$(date +"%Y%m%d%H%M%S")
    mv "$directory_name" "${directory_name}-${current_date}"
    echo "Renamed existing directory to ${directory_name}-${current_date}"
fi

# Clone the GitHub repository into the specified directory
git clone "$github_repository" "$directory_name"

# Check if the cloning was successful
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully into $directory_name"
else
    echo "Failed to clone the repository. Please check the GitHub repository URL and try again."
fi

