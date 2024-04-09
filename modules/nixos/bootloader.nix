{ pkgs, lib, config, spec, ... }:

{
  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ];
    useOSProber = !spec.disable_os_prober;
  };
}

# The --install-bootloader option is required if one wants to (re)install the boot loader on the device specified by your configuration. Without this option, it will not reinstall the bootloader. 
# Most of the time, when one runs nixos-rebuild switch, it will just update the bootloader menu to include the new configuration, without reinstalling the entire bootloader
