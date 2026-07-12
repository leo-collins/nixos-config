{ config, pkgs, ... }:

{
  users.users.leo = {
    uid = 1000;
    group = "leo";
    isNormalUser = true;
    description = "Leo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  users.groups.leo = {
    gid = 1000;
  };

  home-manager.users.leo =
    import ../../../../home/leo/${config.networking.hostName}.nix;
}
