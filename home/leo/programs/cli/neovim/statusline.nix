{ ... }:

# Lualine plugin
# https://github.com/nvim-lualine/lualine.nvim
# https://nix-community.github.io/nixvim/plugins/lualine/index.html

{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings.options = {
      globalstatus = true;
      theme = "auto";
    };
  };
}
