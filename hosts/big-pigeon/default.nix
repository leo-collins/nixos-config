{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix
    ./storage.nix

    ../common/global
    ../common/users/leo

    ../common/optional/ssh.nix
  ];
}
