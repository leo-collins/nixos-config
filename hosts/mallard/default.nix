{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix
    ./niri.nix  # mallard-specific niri config (monitors, etc.)
    ./nvidia.nix  # mallard-specific nvidia drivers (open drivers do not support Pascal GPUs)

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
