{ pkgs, ... }:

# https://www.xquartz.org/

{
  home.packages = [
    pkgs.xquartz
  ];
}
