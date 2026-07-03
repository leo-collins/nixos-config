{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./storage.nix
    ./system.nix

    ../common/global
    ../common/optional/audio.nix
    ../common/optional/bluetooth.nix
    ../common/optional/gnome.nix
    ../common/optional/nvidia.nix
    ../common/optional/ssh.nix
    ../common/optional/steam.nix
  ];
}
