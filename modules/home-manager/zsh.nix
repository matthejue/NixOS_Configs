{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };
}
