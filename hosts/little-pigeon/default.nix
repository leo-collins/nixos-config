{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix
    ./niri.nix  # little-pigeon-specific niri config (monitor, etc.)

    ../common/global
    ../common/users/leo

    ../common/optional/ssh.nix
    ../common/optional/tailscale.nix
    ../common/optional/audio.nix
    ../common/optional/niri.nix
    ../common/optional/noctalia.nix
    ../common/optional/noctalia-greeter.nix
  ];
}
