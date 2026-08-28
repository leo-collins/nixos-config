{ pkgs, ... }:

# https://ejmastnak.com/tutorials/vim-latex/intro/
# https://github.com/lervag/vimtex
# https://nix-community.github.io/nixvim/plugins/vimtex/index.html

# workaround for https://github.com/NixOS/nixpkgs/issues/542483
let
  texlivePkgs = pkgs.texlive.override {
    python3 = pkgs.python313;
    python3Packages = pkgs.python313Packages;
    texlive = texlivePkgs;
  };
  texliveWithMintedFix = texlivePkgs.schemes.texliveFull;
in
{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      autoLoad = true;

      settings = {
        complete_enabled = true;
        compiler_method = "latexmk";
      };

      # use pkgs.texliveFull. Warning: this brings in a lot of packages
      texlivePackage = texliveWithMintedFix;
    };

    # add omni to tex blink completions. The other ones are the defaults
    blink-cmp.settings.sources.per_filetype.tex = [
      "lsp"
      "path"
      "snippets"
      "buffer"
      "omni"
    ];

    treesitter.highlight.disable = [ "latex" ];
  };
}
