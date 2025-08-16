#!/bin/bash

# source
SOURCE="$(pwd)/alacritty.toml"

# destination
LINK_NAME="$HOME/.config/alacritty/alacritty.toml"

# Check if the source exists
if [ ! -e "$SOURCE" ]; then
    echo "Error: Source '$SOURCE' does not exist."
    exit 1
fi

# Create destination directory if needed
mkdir -p "$(dirname "$LINK_NAME")"

# Remove any existing file or symlink at destination
if [[ -L "$LINK_NAME" || -e "$LINK_NAME" ]]; then
  rm -f "$LINK_NAME"
fi

# Create the symbolic link
ln -s "$SOURCE" "$LINK_NAME"

# Check if the symbolic link was created successfully
if [ -L "$LINK_NAME" ]; then
    echo "Symbolic link '$LINK_NAME' created successfully, pointing to '$SOURCE'."
else
    echo "Error: Failed to create symbolic link '$LINK_NAME'."
    exit 1
fi
