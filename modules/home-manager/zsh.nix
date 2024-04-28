{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    shellAliases = {
      gaa = "git add --all";
      gca = "git commit -a";
      gp = "git push";
      gl = "git pull";
      gcl = "git clone";
    };

    initExtra = ''
      # for folder navigation
      autoload -Uz compinit
      compinit -u
      zstyle ':completion:*' menu select
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
