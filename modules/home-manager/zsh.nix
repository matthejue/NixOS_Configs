{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    plugins = [
      {
        name = "zsh-z";
        src = pkgs.fetchFromGitHub {
          owner = "agkozak";
          repo = "zsh-z";
          rev = "afaf2965b41fdc6ca66066e09382726aa0b6aa04";
          hash = "sha256-FnGjp/VJLPR6FaODY0GtCwcsTYA4d6D8a6dMmNpXQ+g=";
        };
      }
    ];

    initExtra = ''
      source ${pkgs.zsh-z}/share/zsh-z/zsh-z.plugin.zsh
    '';
  };
}
