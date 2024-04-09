{ pkgs, lib, config, spec, ... }:

{
  fonts.packages = with pkgs; [
    iosevka
  ];

  environment.systemPackages = with pkgs; [
    font-manager
  ];
}
