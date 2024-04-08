{ pkgs, lib, config, ... }:

{
  # options = { bootloader.enable = lib.mkEnableOption "bootloader"; };
  # config = lib.mkIf config.bootloader.enable {
    # Use the systemd-boot EFI boot loader.
    # boot.loader.systemd-boot.enable = false;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
    # };
}

