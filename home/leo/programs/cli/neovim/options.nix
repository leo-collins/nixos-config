{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    vimAlias = true;

    autoGroups.reload_from_disk = {
      clear = true;
    };

    autoCmd = [
      {
        desc = "Reload files from disk when we focus vim";
        event = "FocusGained";
        pattern = "*";
        command = "if getcmdwintype() == '' | checktime | endif";
        group = "reload_from_disk";
      }
      {
        desc = "Every time we enter an unmodified buffer, check if it changed on disk";
        event = "BufEnter";
        pattern = "*";
        command = "if &buftype == '' && !&modified && expand('%') != '' | exec 'checktime ' . expand('<abuf>') | endif";
        group = "reload_from_disk";
      }
    ];

    # https://neovim.io/doc/user/quickref/#option-list
    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";

      # spacing options
      expandtab = true;
      shiftwidth = 4;
      tabstop = 4;

      # search options
      ignorecase = true;  # ignore case in search pattern
      smartcase = true;  # override `ignorecase` if the pattern contains upper case characters

      # split options
      splitbelow = true;  # splits (Ctrl-w s) are placed below
      splitright = true;

      termguicolors = true;
      undofile = true;
      autoread = true;  # automatically updates buffers when edited outside of nvim
      scrolloff = 10;  # minimum number of lines to keeo at top/bottom of screen
    };
  };
}
