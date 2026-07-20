{ pkgs, lib, ... }:

{
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
  boot.kernelModules = [ "coretemp" "drivetemp" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  system.stateVersion = "26.05";

  # Enable powertop auto-tuning on startup
  powerManagement.powertop.enable = true;

  # Fix for VGA connector reporting all-zero EDID
  # If you plug a VGA cable in, it will not be picked up
  # automatically. You'll need to reboot.
  boot.kernelParams = [ "drm_kms_helper.poll=0" ];
}
