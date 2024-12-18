#!/bin/bash

# Check if the directory path is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 /path/to/directory"
  exit 1
fi

# Define the directory containing SEGD files
SEGD_DIR="$1"

# Check if the directory exists
if [[ ! -d "$SEGD_DIR" ]]; then
  echo "Directory not found: $SEGD_DIR"
  exit 1
fi

# Process each SEGD file in the directory
for SEGD_FILE in "$SEGD_DIR"/*.segd; do
  if [[ ! -f "$SEGD_FILE" ]]; then
    echo "No SEGD files found in directory: $SEGD_DIR"
    exit 1
  fi

  # Read the common header (first 32 bytes)
  COMMON_HEADER=$(xxd -l 32 "$SEGD_FILE")

  # Extract the FFID number from the header
  # Assuming FFID is at the start of the header (first 4 bytes)
  FFID_HEX=$(echo "$COMMON_HEADER" | head -n 1 | cut -d' ' -f2 | cut -c1-4)
  FFID=$(printf "%04x" "0x$FFID_HEX")

  # Construct the new file name
  NEW_FILE_NAME="FFID${FFID}.segd"

  # Rename the SEGD file
  mv "$SEGD_FILE" "$(dirname "$SEGD_FILE")/$NEW_FILE_NAME"

  # Print the new file name
  echo "Renamed $SEGD_FILE to $NEW_FILE_NAME"
done
