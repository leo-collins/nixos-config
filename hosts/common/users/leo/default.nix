{ config, pkgs, ... }:

{
  users.users.leo = {
    isNormalUser = true;
    description = "Leo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  home-manager.users.leo =
    import ../../../../home/leo/${config.networking.hostName}.nix;
}
