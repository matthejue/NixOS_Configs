# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, spec, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos/bootloader.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/user.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/sound.nix
      ../../modules/nixos/shell.nix
      ../../modules/nixos/fonts.nix
      ../../modules/nixos/misc.nix
      ../../modules/nixos/xremap.nix
    ] ++ (if (builtins.elem "hyprland" spec.desktop_environments) then [../../modules/nixos/hyprland.nix] else [])
      ++ (if (builtins.elem "kde" spec.desktop_environments) then [../../modules/nixos/kde.nix] else []);
}

