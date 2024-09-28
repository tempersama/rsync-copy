#!/bin/sh -l

set -e

# Quick checks for missing parameters
empty() {
	echo "ERROR: $1 is empty"
}

[[ "$INPUT_HOST" ]]   		&& empty host
[[ "$INPUT_SOURCE" ]] 		&& empty source
[[ "$INPUT_DESTINATION" ]] 	&& empty destination
[[ "$INPUT_USERNAME" ]] 		&& empty username
[[ "$INPUT_KEY" ]] 			&& empty key



echo -e "${INPUT_KEY}" > key
chmod 400 key

# TODO: make sure we are not just blindly using StrictHostKeyChecking=no
rsync \
	-a -v \ --stats \
	-e "ssh -o StrictHostKeyChecking=no -i key" \
	--port "$INPUT_PORT" \
	"$INPUT_SOURCE" \
	"$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"

