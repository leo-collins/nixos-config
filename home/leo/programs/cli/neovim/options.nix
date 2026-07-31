{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";

      expandtab = true;
      shiftwidth = 4;
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
