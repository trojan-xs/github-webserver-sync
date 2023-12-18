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

# Check if the original directory exists
if [ -d "$directory_name" ]; then
    # Check if the directory is empty
    if [ -z "$(ls -A "$directory_name")" ]; then
        # If the directory is empty, rename the original directory with a timestamp
        current_date=$(date +"%y-%m-%d-%H-%M-%S")
        mv "$directory_name" "${directory_name}-${current_date}.old"
        echo "Renamed existing empty directory to ${directory_name}-${current_date}.old"

        # Create a new directory with the specified name
        mkdir "$directory_name"
        echo "Created new directory: $directory_name"

        # Clone the GitHub repository into the specified directory
        git clone "$github_repository" "$directory_name"
        
        # Check if the cloning was successful
        if [ $? -eq 0 ]; then
            echo "Repository cloned successfully into $directory_name"
        else
            echo "Failed to clone the repository. Please check the GitHub repository URL and try again."
        fi
    else
        # If the directory is not empty, clone the GitHub repository into it
        git clone "$github_repository" "$directory_name"
        
        # Check if the cloning was successful
        if [ $? -eq 0 ]; then
            echo "Repository cloned successfully into $directory_name"
        else
            echo "Failed to clone the repository. Please check the GitHub repository URL and try again."
        fi
    fi
else
    # If the original directory does not exist, create it and clone the GitHub repository into it
    echo "Directory $directory_name does not exist. Creating and cloning into it..."
    git clone "$github_repository" "$directory_name"
    
    # Check if the cloning was successful
    if [ $? -eq 0 ]; then
        echo "Repository cloned successfully into $directory_name"
    else
        echo "Failed to clone the repository. Please check the GitHub repository URL and try again."
    fi
fi

