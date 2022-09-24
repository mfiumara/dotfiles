#!/bin/bash

rm -rf ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Removing any existing tmux configuration"
rm ~/.tmux.conf

echo "Creating sym-link for tmux.conf:"
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ls -hl ~/.tmux.conf
