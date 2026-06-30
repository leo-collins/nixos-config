{ ... }:

{
  imports = [
    ./packages.nix
    ./programs/firefox.nix
    ./programs/codex.nix
    ./programs/git.nix
    ./programs/zen-browser.nix
    ./programs/lazygit.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/fzf.nix
    ./programs/alacritty.nix
  ];

  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
