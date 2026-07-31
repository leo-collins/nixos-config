{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./completion.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./statusline.nix
    ./telescope.nix
    ./theme.nix
    ./tmux-navigator.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
