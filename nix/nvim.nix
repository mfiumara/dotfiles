{ config, pkgs, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.05";
  });
in
{
  imports = [ nixvim.nixosModules.nixvim ];

  environment.systemPackages = with pkgs; [ neovim ];

  # Install nixvim
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    plugins = {
      lualine.enable = true;
#      web-devicons.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
  };
}
