echo "Creating sym-link for nixOS:"
sudo rm /etc/nixos/configuration.nix
sudo ln -s $(pwd)/nix/configuration.nix /etc/nixos/configuration.nix 
ls -hl /etc/nixos/configuration.nix

# TODO: Ideally this can be done in nix config itself in stead of running manually:
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
sudo nix-channel --update

# Rebuild nix
sudo nixos-rebuild switch

