#!/bin/sh -l

set -e

# Checking if the key input is not empty
if [[ "$INPUT_KEY" ]]; then
    # If it is not empty, it uses the key for the rsync command
    echo -e "${INPUT_KEY}" > key   # Creates a file with the key content
    chmod 400 key                  # Set the key as Read-Only

	rsync -e "ssh -p $INPUT_PORT -o StrictHostKeyChecking=no -i key" \
		-r "$INPUT_ORIGIN" \
		"$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"
fi
time=$(date)
echo "-----------------------------"
echo "| Files copied successfully |"
echo "-----------------------------"
