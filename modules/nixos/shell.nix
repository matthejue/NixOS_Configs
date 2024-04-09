{ pkgs, lib, config, spec, ... }:

{
  imports = [
      ../../modules/nixos/zsh.nix
    ];

  users.defaultUserShell = pkgs.zsh;
  # users.users.${spec.user}.shell = pkgs.zsh;

  environment.sessionVariables = {
      EDITOR = "nvim";
      # PATH = "$PATH:/path/to/your/directory";
      PATH = ["$PATH" "/home/${spec.user}/.config/vifm/scripts/vifmimg" "/home/${spec.user}/.config/nixos"];
  };

  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake /home/${spec.user}/.config/nixos#home-machine";
    ncg = "sudo nix-collect-garbage";
  };
  environment.loginShellInit = builtins.readFile ../../de_launcher;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}

