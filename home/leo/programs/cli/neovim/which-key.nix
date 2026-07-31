{ ... }:

# which-key keymap reminder
# https://github.com/folke/which-key.nvim
# https://nix-community.github.io/nixvim/plugins/which-key/index.html

{
  programs.nixvim = {
    plugins.which-key.enable = true;

    keymaps = [
      {
        mode = "n";
        key = "<leader>?";
        action.__raw = ''
          function()
            require("which-key").show({ global = false })
          end
        '';
        options.desc = "Buffer-local keymaps";
      }
    ];
  };
}
