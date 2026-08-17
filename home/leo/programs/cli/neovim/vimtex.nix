{ pkgs, ... }:

# https://ejmastnak.com/tutorials/vim-latex/intro/
# https://github.com/lervag/vimtex
# https://nix-community.github.io/nixvim/plugins/vimtex/index.html

{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;

      # additional packages to bring in
      texlivePackage = pkgs.texliveMedium.withPackages (ps: [
        ps.notoccite
      ]);
    };

    treesitter.highlight.disable = [ "latex" ];
  };
}

