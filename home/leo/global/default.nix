{ ... }:

{
  imports = [
    ../programs/cli
    ../programs/desktop
    ../programs/games
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
