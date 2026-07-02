{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/storage.nix
    ./modules/system.nix
    ./modules/networking.nix
    ./desktop/plasma.nix
    ./modules/graphics.nix
    ./modules/steam.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/users.nix
    ./modules/ssh.nix
    ./modules/packages.nix
    ./modules/shells.nix
  ];
}
