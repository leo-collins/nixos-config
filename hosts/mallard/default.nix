{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix

    ../common/global
    ../common/users/leo

    ./nvidia.nix
    ../common/optional/ssh.nix
    ../common/optional/audio.nix
    ../common/optional/niri.nix
    ../common/optional/noctalia.nix
    ../common/optional/noctalia-greeter.nix
  ];
}
