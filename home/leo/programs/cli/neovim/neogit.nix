{ ... }:

{
  programs.nixvim.plugins = {
    neogit = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<cr>";
      options.desc = "Open Neogit UI";
    }
  ];
}
