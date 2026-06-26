{ ... }:

{
  imports = [
    ./packages.nix
    ./programs/firefox.nix
    ./programs/git.nix
    ./programs/zen-browser.nix
    ./programs/lazygit.nix
    ./programs/fish.nix
  ];

  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
