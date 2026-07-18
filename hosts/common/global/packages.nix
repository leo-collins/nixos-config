{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    parted
    unzip
    sops
  ];
}
