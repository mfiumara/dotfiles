#!/bin/bash

echo "Installing VIM Plugin manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying .vimrc and .zshrc into home folder"
cp .vimrc ~
cp .zshrc ~

echo "Installing ohmyzsh"
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
