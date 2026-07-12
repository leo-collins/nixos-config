{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.ipmitool
    pkgs.usbutils
  ];
}
