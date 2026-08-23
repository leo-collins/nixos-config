{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix
    ./secrets.nix

    ../common/global
    ../common/users/leo

    ../common/optional/audio.nix
    ../common/optional/bluetooth.nix
    ../common/optional/nfs-client.nix
    ../common/optional/ssh.nix
    ../common/optional/niri.nix
    ../common/optional/noctalia.nix

  ];
}
