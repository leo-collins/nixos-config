{ config, ... }:

{
  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d --no-gc-roots";
    };
  };
}
