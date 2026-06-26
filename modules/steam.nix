{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;
}
