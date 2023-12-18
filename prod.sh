#!/bin/bash

# Function to check if a directory is empty
is_directory_empty() {
    shopt -s nullglob
    files=("$1"/*)
    shopt -u nullglob
    if [ ${#files[@]} -eq 0 ]; then
        return 0   # Directory is empty
    else
        return 1   # Directory is not empty
    fi
}

# Function to clone GitHub repo into a directory
clone_repo() {
    repo_url=$1
    target_dir=$2

    # Check if the target directory exists
    if [ ! -d "$target_dir" ]; then
        # If it doesn't exist, create and clone into it
        mkdir "$target_dir"
        git clone "$repo_url" "$target_dir"
    else
        # If it exists, check if it's empty
        if is_directory_empty "$target_dir"; then
            # If it's empty, rename and create a new directory
            timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
            mv "$target_dir" "$target_dir-$timestamp.old"
            mkdir "$target_dir"
            git clone "$repo_url" "$target_dir"
        else
            # If it's not empty, just clone into it
            git clone "$repo_url" "$target_dir"
        fi
    fi
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <repo_url> <target_directory>"
    exit 1
fi

# Call the function with provided arguments
clone_repo "$1" "$2"

