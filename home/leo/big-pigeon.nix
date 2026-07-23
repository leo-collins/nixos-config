{ ... }:

{
  imports = [
    ./global

    ./programs/cli/beets.nix
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
