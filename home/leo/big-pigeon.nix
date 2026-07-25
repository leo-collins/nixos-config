{ ... }:

{
  imports = [
    ./global
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
