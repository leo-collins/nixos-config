{ ... }:

{
  imports = [
    ./nix.nix
    ./packages.nix
    ./shells.nix
    ./system.nix
    ./users.nix
  ];

  networking.networkmanager.enable = true;
}
