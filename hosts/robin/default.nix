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
    ../common/optional/ssh.nix
    ../common/optional/gnome.nix
    ../common/optional/desktop-programs
  ];
}
