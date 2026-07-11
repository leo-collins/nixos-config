{ pkgs, lib, ... }:

{
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  system.stateVersion = "26.05";
}
