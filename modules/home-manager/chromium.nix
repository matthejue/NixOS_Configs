{ pkgs, lib, config, ... }:

{
  programs.chromium = {
  enable = true;
    extensions = [
      "gjoijpfmdhbjkkgnmahganhoinjjpohk" # Screenshot YouTube
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "egpjdkipkomnmjhjmdamaniclmdlobbo" # Firenvim
    ];
  };
}
