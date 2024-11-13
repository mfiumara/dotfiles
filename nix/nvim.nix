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
#    colorscheme onedark
#    colorscheme kanagawa

    # Set up specific settings directly.
    opts = {
      timeout = true;
      timeoutlen = 10;
      encoding = "UTF-8";
      updatetime = 100;
      foldenable = true;
      foldmethod = "indent";
      mouse = "a";
      compatible = false;
      number = true;
      relativenumber = true;
      ruler = true;
    };

    globals = {
      extraConfigLua = ''
-- Disable space key
vim.api.nvim_set_keymap('n', '<SPACE>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Customize fill characters
vim.o.fillchars = vim.o.fillchars .. 'diff:╱'

-- Enable filetype detection, indentation, and plugins
vim.cmd([[
  filetype on
  filetype indent on
  filetype plugin on
]])
    '';
    };
    plugins = {
      lualine.enable = true;
#      web-devicons.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
  };
}
