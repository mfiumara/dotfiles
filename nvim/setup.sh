#!/bin/bash

# Make nvim directory if it does not yet exist
mkdir -p ~/.config/nvim
mkdir -p ~/.vim

echo "Removing any existing init files"
rm ~/.config/nvim/init.vim
rm ~/.config/nvim/init.lua
rm -r ~/.config/nvim/lua

echo "Removing any existing snippets"
rm -r ~/.vim/UltiSnips

# Create symbolic link in local system to nvim config in this repo
echo "Creating sym-link for init.vim:"
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ls -hl ~/.config/nvim/init.vim

echo "Creating sym-link for init.lua:"
ln -s $(pwd)/nvim/init.lua ~/.config/nvim/init.lua
ln -s $(pwd)/nvim/lua ~/.config/nvim/lua
ls -hl ~/.config/nvim/init.lua


echo "Creating sym-link for ultisnips:"
ln -s $(pwd)/nvim/UltiSnips ~/.vim/UltiSnips
ls -hl ~/.vim

echo "Creating sym-link for coc-settings:"
ln -s $(pwd)/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ls -hl ~/.vim

