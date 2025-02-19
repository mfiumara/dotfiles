# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
#  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
#  services.pipewire.enable = false;
#  services.pipewire = {
#   enable = true;
#   alsa.enable = true;
#   alsa.support32Bit = true;
#   pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
# };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mattiaf = {
    isNormalUser = true;
    description = "Mattia Fiumara";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # Fonts
  fonts.packages = with pkgs; [ nerdfonts ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define home-manager settings inside configuration as module
  home-manager.users.mattiaf = { pkgs, ... }: {
    programs = {
      direnv.enable = true;
      zsh = {
        enable = true;
	enableCompletion = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
          enable = true;
          theme = "robbyrussell";
          plugins = [
            "git"
            "history"
	    "sudo"
          ];
        };
      };
     tmux = {
       enable = true;
       shell = "${pkgs.zsh}/bin/zsh";
     };
     kitty = {
       enable = true;
       extraConfig = ''
         map f11 toggle_fullscreen
       '';
       font.name = "FiraCode Nerd Font";
     };
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.05";
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
      nrf-command-line-tools
      segger-jlink
      tmux
      git
      go
      kitty
      neofetch
      slack
      wl-clipboard
      zsh
      oh-my-zsh
      vscode
      direnv
      spotify
      jq
      fd
      cmake
      python3
      mongodb-compass
      saleae-logic-2
      rustup
      pkg-config
      openssl
      stdenv.cc.cc
      kicad
      inetutils
      gcc
      glibc
      glibc.dev
      google-chrome
      jetbrains.rust-rover
      jetbrains.goland
      ripgrep
      probe-rs
      google-cloud-sdk
      wireshark
      okular
      pinta
      openvpn
      nodejs_22
      docker
      htop
      todoist
      todoist-electron
      alacritty
      neovim
	  # Deps required by neovim and plugins
	  # TODO: Move to a nix flake
      unzip
	  luajitPackages.luarocks
	  clang-tools
  ];

  # This seems like a dirty hack to get cargo to build some packages.
  # This should belong in a local config
  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    # This is very wrong but this hack works to get jupyter working and jlink
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib:/run/current-system/sw/lib";
    JLINK_PATH="/run/current-system/sw/lib/libjlinkarm.so";
  };

  # Required for nrf-command-line-tools
  nixpkgs.config.permittedInsecurePackages = [
    "segger-jlink-qt4-794l"
  ];
  nixpkgs.config.segger-jlink.acceptLicense = true;

  services.udev.packages = [ pkgs.segger-jlink pkgs.saleae-logic-2 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports 
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

