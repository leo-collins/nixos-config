{ lib, ... }:

{
  imports = [
    ../programs/cli
  ];

  home = {
    # We allow these to be overriden, by e.g. a macos host
    username = lib.mkDefault "leo";
    homeDirectory = lib.mkDefault "/home/leo";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
