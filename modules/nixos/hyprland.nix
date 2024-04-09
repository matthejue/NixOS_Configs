{ pkgs, lib, config, ... }:

{
  programs.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    xwayland.enable = true;
  };
  
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    wev
    # eww-wayland
    waybar
    hyprpaper
    mpvpaper
    # wofi
    bemenu
    dunst
    libnotify
    copyq
    wl-clipboard
    wallust
    playerctl
    brightnessctl
    # flameshot
    grim
    slurp
    swappy
  ];
}
