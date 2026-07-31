{ pkgs, ... }:

# Tmux navigator plugin
# https://github.com/christoomey/vim-tmux-navigator
# https://nix-community.github.io/nixvim/plugins/tmux-navigator/index.html

{
  programs.nixvim.plugins.tmux-navigator = {
    enable = true;
    settings.no_mappings = 1;

    keymaps = [
      {
        key = "<C-h>";
        action = "left";
      }
      {
        key = "<C-j>";
        action = "down";
      }
      {
        key = "<C-k>";
        action = "up";
      }
      {
        key = "<C-l>";
        action = "right";
      }
      {
        key = "<C-\\>";
        action = "previous";
      }
    ];
  };

  programs.tmux.plugins = [
    pkgs.tmuxPlugins.vim-tmux-navigator
  ];
}
