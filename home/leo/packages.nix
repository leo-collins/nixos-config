{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    wget
    curl
    vim
    codex
    tree
  ];
}
