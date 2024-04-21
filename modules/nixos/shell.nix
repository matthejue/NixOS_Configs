{ pkgs, lib, config, spec, ... }:

{
  imports = [
      ../../modules/nixos/zsh.nix
    ];

  users.defaultUserShell = pkgs.zsh;

  environment.sessionVariables = {
      EDITOR = "nvim";
      # Zsh uses its own line editor called the Zsh Line Editor (ZLE), which
      # has both an Emacs mode and a vi mode. 
      # If the VISUAL or EDITOR environment variables contain the string "vi",
      # then vi mode will be used by default in ZLE. Otherwise, it will default
      # to Emacs mode. 
      # To explicitly set the vi mode in zsh, you can use the command bindkey
      # -v. This will enable the vi editing mode in the global keymap 
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

