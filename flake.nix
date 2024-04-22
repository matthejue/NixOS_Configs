{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
    # when accidently removing git: nix shell nixpkgs#git -c nixos-rebuild switch --flake /home/areo/.config/nixos#home-machine
  };

  outputs = inputs@{ nixpkgs, home-manager, xremap-flake, ... }: 
  let 
    system = "x86_64-linux";
    spec = {
      user = "areo";
      disable_os_prober = true;
      desktop_environments = ["hyprland" "kde"];
    };
  in {
    nixosConfigurations = {
      home-machine = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/home-machine/configuration.nix
        ];
        specialArgs = {
          inherit spec;
        };
      };
    };
    homeConfigurations = {
      areo = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./modules/home-manager/home.nix
          xremap-flake.nixosModules.default
        ];
        # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        extraSpecialArgs = {
          inherit spec;
        };
      };
    };
  };
}
