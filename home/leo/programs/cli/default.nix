{ pkgs, ... }:

{
  imports = [
    ./btop.nix
    ./codex.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./lazygit.nix
    ./neovim
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
    ./fastfetch.nix
    ./direnv.nix
    ./nh.nix
  ];

  home.packages = with pkgs; [
    wget
    curl
    tree
  ];
}
