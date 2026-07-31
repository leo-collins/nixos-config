{ ... }:

# Telescope search
# https://github.com/nvim-telescope/telescope.nvim
# https://nix-community.github.io/nixvim/plugins/telescope/index.html

{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Telescope find files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Telescope live grep";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Telescope buffers";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Telescope help tags";
        };
      };

      settings = {
        pickers.find_files = {
          hidden = true;
          follow = true;
        };
        defaults = {
          file_ignore_patterns = [
            "%.git/"
            "__pycache__/"
          ];
        };
      };

      extensions.fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
    };

    web-devicons.enable = true;
  };
}
