#production script

#!/bin/bash

# Function to clone GitHub repo into a directory
clone_repo() {
    repo_url=$1
    target_dir=$2

    # If the target directory exists, create a backup
    if [ -d "$target_dir" ]; then
        timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
        mv "$target_dir" "$target_dir-$timestamp.old"
    fi

    # Clone the repository into the target directory
    git clone "$repo_url" "$target_dir"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <repo_url> <target_directory>"
    exit 1
fi

# Call the function with provided arguments
clone_repo "$1" "$2"
