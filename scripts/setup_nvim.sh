echo "Removing existing ~/.config/nvim directory"
rm -r ~/.config/nvim

echo "sym-link nvim directory into home config"
ln -s $(pwd)/nvim ~/.config/nvim
ls -hl ~/.config/nvim

