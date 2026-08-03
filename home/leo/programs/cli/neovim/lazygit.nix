{ ... }:

{
  programs.nixvim.plugins = {
    lazygit = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>lz";
      action = "<cmd>LazyGit<cr>";
      options.desc = "Open Lazygit TUI";
    }
  ];
}
   
