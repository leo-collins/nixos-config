{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/graphics.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/users.nix
    ./modules/ssh.nix
    ./modules/packages.nix
    ./modules/shells.nix
  ];
}
