#!/bin/bash

# Make nvim directory if it does not yet exist
mkdir -p ~/.config/nvim

echo "Removing any existing init.vim"
rm ~/.config/nvim/init.vim

echo "Removing any existing snippets"
rm -r ~/.vim/UltiSnips

# Create symbolic link in local system to nvim config in this repo
echo "Creating sym-link for init.vim:"
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ls -hl ~/.config/nvim/init.vim

echo "Creating sym-link for ultisnips:"
ln -s $(pwd)/nvim/UltiSnips ~/.vim/UltiSnips
ls -hl ~/.vim

