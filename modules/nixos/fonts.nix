{ pkgs, lib, config, ... }:

{
  fonts.packages = with pkgs; [
    iosevka
    # https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip
  ];

  environment.systemPackages = with pkgs; [
    font-manager
  ];
}
