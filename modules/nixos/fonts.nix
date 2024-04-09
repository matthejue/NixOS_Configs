{ pkgs, lib, config, ... }:

{
  fonts.packages = with pkgs; [
    iosevka
  ];

  environment.systemPackages = with pkgs; [
    font-manager
  ];
}
