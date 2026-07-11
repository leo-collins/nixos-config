{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix

    ../common/global
    ../common/users/leo

    ../common/optional/ssh.nix
  ];
}
