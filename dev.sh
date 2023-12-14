#development script
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
        # If the directory is empty, dump the git clone contents into it
        echo "Directory ${directory_name} is empty. Cloning into it..."
        git clone "$github_repository" "$directory_name"
    else
        # If the directory is not empty, rename the original directory with the current date
        current_date=$(date +"%Y-%m-%d-%H-%M-%S")
        mv "$directory_name" "${directory_name}-${current_date}"
        echo "Renamed original directory to ${directory_name}-${current_date}"

        # Clone the GitHub repository into the specified directory
        git clone "$github_repository" "$directory_name"

        # Check if the cloning was successful
        if [ $? -eq 0 ]; then
            echo "Repository cloned successfully into $directory_name"

            # Create a tar.gz archive of the original directory
            tar -czvf "${directory_name}-${current_date}.tar.gz" "${directory_name}-${current_date}"
            echo "Created tar.gz archive: ${directory_name}-${current_date}.tar.gz"

            # Delete the original directory
            rm -rf "${directory_name}-${current_date}"
            echo "Deleted original directory ${directory_name}-${current_date}"
        else
            echo "Failed to clone the repository. Please check the GitHub repository URL and try again."
        fi
    fi
else
    # If the original directory does not exist, create it and dump the git clone contents into it
    echo "Directory ${directory_name} does not exist. Cloning into it..."
    git clone "$github_repository" "$directory_name"
fi
