{ ... }:

# Language server config
# https://nix-community.github.io/nixvim/lsp/servers/index.html


{
  programs.nixvim = {
    lsp = {
      servers.nixd.enable = true;

      keymaps = [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gr";
          lspBufAction = "references";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
        {
          key = "<leader>rn";
          lspBufAction = "rename";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
      ];
    };

    diagnostic.settings = {
      virtual_text = true;
      severity_sort = true;
    };
  };
}
