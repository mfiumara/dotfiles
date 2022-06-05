#!/bin/bash

rm -rf ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm ~/.tmux.conf && ln -s $(pwd)/.tmux.conf ~/.tmux.conf
