#!/bin/bash

# Make nvim directory if it does not yet exist
mkdir -p ~/.config/nvim

# Create symbolic link in local system to nvim config in this repo
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim
