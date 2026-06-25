{ ... }:

{
  imports = [
    ./packages.nix
    ./programs/firefox.nix
    ./programs/zen-browser.nix
  ];

  home.username = "leo";
  home.homeDirectory = "/home/leo";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
