{ pkgs, ... }:

{
  imports = [
    ./btop.nix
    ./codex.nix
    ./eza.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./lazygit.nix
    ./starship.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
    ./fastfetch.nix
  ];

  home.packages = with pkgs; [
    wget
    curl
    tree
  ];
}
