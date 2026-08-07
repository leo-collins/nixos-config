{ ... }:

# Language server config
# https://nix-community.github.io/nixvim/lsp/servers/index.html


{
  programs.nixvim = {
    plugins.lspconfig.enable = true;

    lsp = {
      servers = {
        nixd.enable = true;  # nix
        pyrefly.enable = true;  # python
        rust_analyzer.enable = true;  # rust
        clangd.enable = true;  # C/C++
        bashls.enable = true;  # bash
        texlab.enable = true;  # latex
      };

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
