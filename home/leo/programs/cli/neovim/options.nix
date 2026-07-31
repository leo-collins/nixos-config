{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";

      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;

      ignorecase = true;
      smartcase = true;
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      undofile = true;
    };
  };
}
