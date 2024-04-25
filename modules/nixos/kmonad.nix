{ config, lib, pkgs, spec, ... }:

{
   services.kmonad = {
   enable = true;
   # keyboards = {
   #   { any name for your keyboard } = {
   #     device = "/dev/input/by-id/{ your keyboard id that usually ends with -kbd }";
   #     config = ''
   #           { content of config.kbd here }
   #       '';
   #   };
   # }; 
	# Modify the following line if you copied nixos-module.nix elsewhere or if you want to use the derivation described above
	# package = import /pack/to/kmonad.nix;
  };
}
