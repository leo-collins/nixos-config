{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./secrets.nix
    ./system.nix
    ./storage.nix
    ./packages.nix

    ../common/global
    ../common/users/leo

    ../common/optional/ssh.nix
    
    # Services
    ./services/immich.nix
    ./services/navidrome.nix
    ./services/incus.nix
    ./services/nfs.nix
    ./services/samba.nix
    ./services/tailscale.nix

    ./services/media
  ];
}
