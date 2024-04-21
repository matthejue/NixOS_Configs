{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    # promptInit = ''
    #   eval "$(${pkgs.starship}/bin/starship init zsh)"
    # '';
  };
}
