#!/bin/sh -l

set -e

echo -e "${INPUT_KEY}" > key
chmod 400 key

# TODO: make sure we are not just blindly using StrictHostKeyChecking=no
rsync \
	-a -v --stats \
	-e "ssh -o StrictHostKeyChecking=no -i key" \
	--port "$INPUT_PORT" \
	"$INPUT_SOURCE" \
	"$INPUT_USERNAME"@"$INPUT_HOST":"$INPUT_DESTINATION"

