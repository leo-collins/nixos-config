{ ... }:

# Treesitter parser
# https://github.com/tree-sitter/tree-sitter
# https://nix-community.github.io/nixvim/plugins/treesitter/index.html

{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
