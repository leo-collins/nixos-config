{ ... }:

{
  imports = [
    ./completion.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./statusline.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
