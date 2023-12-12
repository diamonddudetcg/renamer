#!/bin/bash

# Get the current directory of the script
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Print the script directory for debugging
echo "Script directory: $script_dir"

# Change directory to the script directory
cd "$script_dir" || exit

# Loop through each file in the current directory
for file in *; do
    # Check if the file is a regular file (not a directory)
    if [ -f "$file" ]; then
        # Check if the file contains the specified string
        if grep -q "1P Episode" "$file"; then
            # Rename the file, replacing "1P Episode" with "One Piece -"
            new_name=$(echo "$file" | sed 's/1P Episode/One Piece -/')
            mv "$file" "$new_name"
            echo "Renamed: $file -> $new_name"
        fi
    fi
done
