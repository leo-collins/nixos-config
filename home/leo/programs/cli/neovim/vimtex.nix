{ pkgs, ... }:

# https://ejmastnak.com/tutorials/vim-latex/intro/
# https://github.com/lervag/vimtex
# https://nix-community.github.io/nixvim/plugins/vimtex/index.html

{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      # use texliveFull. Warning: this brings in a lot of packages
      texlivePackage = pkgs.texliveFull;
    };

    treesitter.highlight.disable = [ "latex" ];
  };
}

