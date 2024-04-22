{ pkgs, lib, config, ... }:

{
  programs.chromium = {
  enable = true;
    extensions = [
      "dpacanjfikmhoddligfbehkpomnbgblf" # AHA Music
      # "plhdclenpaecffbcefjmpkkbdpkmhhbj" # Discrub
      # "fngmhnnpilhplaeedifhccceomclgfbg" # EditThisCookie
      # "ckkdlimhmcjmikdlpkmbgfkaikojcbjk" # Markdown Viewer
      # "emfmnikpggjpmcngklkifngaplokogja" # Replace Image Locally
      "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube Dislike
      "gjoijpfmdhbjkkgnmahganhoinjjpohk" # Screenshot YouTube
      "mmioliijnhnoblpgimnlajmefafdfilb" # Shazam
      # "ilcdiicigjaccgipndigcenjieedjohj" # Simple Video Download Helper
      # "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "nffaoalbilbmmfgbnbgppjihopabppdk" # Video Speed Controller
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "ekhagklcjbdpajgpjgmbionohlpdbjgc" # Zotero Connector
    ];
  };
}
