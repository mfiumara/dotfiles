#!/bin/bash

# Make nvim directory if it does not yet exist
mkdir -p ~/.config/nvim

echo "Removing any existing init.vim"
rm ~/.config/nvim/init.vim

# Create symbolic link in local system to nvim config in this repo
echo "Creating sym-link for init.vim:"
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ls -hl ~/.config/nvim/init.vim
