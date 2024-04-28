{ pkgs, lib, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "areotwister";
    userEmail = "areotwister@gmail.com";
  };
}
