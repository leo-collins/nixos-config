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
    ../common/optional/tailscale.nix 
    
    # Services
    # ./services/immich.nix
    ./services/navidrome.nix
    ./services/incus.nix
    ./services/nfs.nix
    ./services/samba.nix
    ./services/caddy.nix
    ./services/tailscale_proxy.nix
    ./services/slskd.nix
    ./services/qbittorrent.nix
    ./services/actual.nix

    ./services/media

    ./services/minecraft.nix
  ];
}
