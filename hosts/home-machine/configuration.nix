# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, spec, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/bootloader.nix
      ../../modules/nixos/hyprland.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "de-latin1-nodeadkeys";
  #   useXkbConfig = true; # use xkb.options in tty.
  };

  services.desktopManager.plasma6.enable = true;

environment.sessionVariables = {
    EDITOR = "nvim";
    # PATH = "$PATH:/path/to/your/directory";
    PATH = ["$PATH" "/home/${spec.user}/.config/vifm/scripts/vifmimg" "/home/${spec.user}/.config/nixos"];
};

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.displayManager.startx.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "de";
  # services.xserver.xkb.variant = "nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  security.rtkit.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

boot.kernel.sysctl = {
  "kernel.sysrq" = 1; # Enable the SysRq key
};

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-wlr ];

  users.groups = {
    users = {};
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${spec.user}" = {
    isNormalUser = true;
    home = "/home/" + spec.user;
    initialPassword = "q";
    extraGroups = [ "wheel" "users" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
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
    ];
  };

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
    git
    stow
    neovim # can later be removed
    wget
    starship
    font-manager
    htop
    ripgrep
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fonts.packages = with pkgs; [
    iosevka
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };

  users.defaultUserShell = pkgs.zsh;
  # users.users.${spec.user}.shell = pkgs.zsh;
  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake /home/${spec.user}/.config/nixos#home-machine";
    ncg = "sudo nix-collect-garbage";
  };
  environment.loginShellInit = builtins.readFile ../../de_launcher;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}

