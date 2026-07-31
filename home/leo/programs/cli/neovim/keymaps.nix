{ ... }:

{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>cd";
      action = "<cmd>Explore<cr>";
      options.desc = "Open file explorer";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<cmd>write<cr>";
      options.desc = "Save file";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>quit<cr>";
      options.desc = "Quit";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<cr>";
      options.desc = "Clear search highlighting";
    }
  ];
}
