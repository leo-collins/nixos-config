{ pkgs, ... }:

# https://ejmastnak.com/tutorials/vim-latex/intro/
# https://github.com/lervag/vimtex
# https://nix-community.github.io/nixvim/plugins/vimtex/index.html

{
  programs.nixvim.plugins = {
    vimtex = {
      enable = true;
      autoLoad = true;

      settings = {
        complete_enabled = true;
        compiler_method = "latexmk";
      };

      # use texliveFull. Warning: this brings in a lot of packages
      texlivePackage = pkgs.texliveFull;
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
