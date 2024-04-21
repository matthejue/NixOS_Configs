{ pkgs, lib, config, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # plugins = with pkgs; [
    #   vimPlugins.lush-nvim
    # ];

    extraPackages = with pkgs; [
      lua-language-server
      stylua
      pyright
      black
      nodePackages.bash-language-server
      shfmt
      gopls
      gotools
      clang-tools
      jsonfmt
      texlab
      perl538Packages.LatexIndent
    ];
  };
}
