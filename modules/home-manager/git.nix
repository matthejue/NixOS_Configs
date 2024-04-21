{ pkgs, lib, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "areotwister";
    userEmail = "areotwister@gmail.com";
    aliases = {
      gc = "commit";
      gl = "pull";
      gp = "push";
      gst = "status";
    };
  };
}
