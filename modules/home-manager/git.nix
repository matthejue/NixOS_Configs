{ pkgs, lib, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Areotwister"
    userEmail = "areotwister@gmail.com"
    aliases = {
      gc = "commit";
      gl = "pull";
      gp = "push";
    };
  };
}
