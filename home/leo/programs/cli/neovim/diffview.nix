{ ... }:

# Diffview.nvim Git diff and history UI
# https://github.com/sindrets/diffview.nvim
# https://nix-community.github.io/nixvim/plugins/diffview/index.html

{
  programs.nixvim.plugins.diffview.enable = true;

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<cr>";
      options.desc = "Open Git diff view";
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>DiffviewClose<cr>";
      options.desc = "Close Git diff view";
    }
    {
      mode = "n";
      key = "<leader>gh";
      action = "<cmd>DiffviewFileHistory %<cr>";
      options.desc = "Open Git file history";
    }
  ];
}
