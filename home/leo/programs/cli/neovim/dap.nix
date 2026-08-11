{ ... }:

# Debug Adapter Protocol support
# https://nix-community.github.io/nixvim/plugins/dap/index.html
# https://nix-community.github.io/nixvim/plugins/dap-ui/index.html
# https://nix-community.github.io/nixvim/plugins/dap-python/index.html

{
  programs.nixvim = {
    plugins = {
      dap.enable = true;
      dap-ui.enable = true;

      # Send Python stdout/stderr through DAP so it is available in the
      # built-in REPL and the dap-ui REPL pane.
      dap-python = {
        enable = true;
        settings.console = "internalConsole";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>db";
        action = "<cmd>DapToggleBreakpoint<cr>";
        options.desc = "Debug: toggle breakpoint";
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = "<cmd>DapContinue<cr>";
        options.desc = "Debug: continue / start";
      }
      {
        mode = "n";
        key = "<leader>di";
        action = "<cmd>DapStepInto<cr>";
        options.desc = "Debug: step into";
      }
      {
        mode = "n";
        key = "<leader>do";
        action = "<cmd>DapStepOver<cr>";
        options.desc = "Debug: step over";
      }
      {
        mode = "n";
        key = "<leader>dO";
        action = "<cmd>DapStepOut<cr>";
        options.desc = "Debug: step out";
      }
      {
        mode = "n";
        key = "<leader>dp";
        action = "<cmd>DapPause<cr>";
        options.desc = "Debug: pause";
      }
      {
        mode = "n";
        key = "<leader>dr";
        action = "<cmd>DapToggleRepl<cr>";
        options.desc = "Debug: toggle console";
      }
      {
        mode = "n";
        key = "<leader>du";
        action = "<cmd>lua require('dapui').toggle()<cr>";
        options.desc = "Debug: toggle UI";
      }
      {
        mode = "n";
        key = "<leader>de";
        action = "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line', source = 'nvim-dap', focus = true })<cr>";
        options.desc = "Debug: show exception";
      }
      {
        mode = "n";
        key = "<leader>dE";
        action = "<cmd>lua require('dap').set_exception_breakpoints({'raised', 'uncaught'})<cr>";
        options.desc = "Debug: break on exceptions";
      }
      {
        mode = "n";
        key = "<leader>dl";
        action = "<cmd>DapShowLog<cr>";
        options.desc = "Debug: show adapter log";
      }
      {
        mode = "n";
        key = "<leader>dx";
        action = "<cmd>DapTerminate<cr>";
        options.desc = "Debug: terminate";
      }
    ];
  };
}
