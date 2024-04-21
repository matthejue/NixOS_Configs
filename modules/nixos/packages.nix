
{ pkgs, lib, config, spec, ... }:

{
  users.users."${spec.user}".packages = with pkgs; [
      chromium
      mpv
      okular
      zellij
      nsxiv
      pdfarranger
      gromit-mpx
      # networkmanagerapplet
      discord
      telegram-desktop
      aerc
      android-file-transfer
      audacity
      asciinema
      ascii
      biber
      texliveFull
      obs-studio
      gimp
      inkscape
      lazygit
      # imagemagick
      prismlauncher
      steam
      neofetch
    ];

  nixpkgs.config.allowUnfree = true; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vifm
    ueberzugpp
    ffmpegthumbnailer
    atool
    unzip
    killall
    gcc
    # git
    stow
    neovim # can later be removed
    wget
    starship
    htop
    ripgrep
    nix-index
    nix-prefetch-github
    coreutils
  ];
}


