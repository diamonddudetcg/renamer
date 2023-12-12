#!/bin/bash

# Get the current directory of the script
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print the script directory for debugging
echo "Script directory: $script_dir"

# Change directory to the script directory
cd "$script_dir" || exit

# Loop through each file in the current directory
for file in *; do
    # Debugging information
    echo "Entering loop for file: $file"

    # Check if the file is a regular file (not a directory)
    if [ -f "$file" ]; then
        # Calculate the new name, replacing "1P Episode" with "One Piece -"
        new_name=$(echo "$file" | sed 's/1P Episode/One Piece -/')

        # Check if renaming is necessary
        if [ "$file" != "$new_name" ]; then
            # Debugging information
            echo "Processing file: $file"
            
            # Rename the file
            mv "$file" "$new_name"
            echo "Renamed: $file -> $new_name"
        else
            # Debugging information
            echo "Left $file alone"
        fi
    else
        # Debugging information
        echo "Skipped $file (not a regular file)"
    fi
done

echo "Script execution complete"
