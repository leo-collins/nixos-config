{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./system.nix
    ./storage.nix
    ./packages.nix

    ../common/global
    ../common/users/leo

    ../common/optional/ssh.nix
    
    # Services
    ./services/immich.nix
    ./services/navidrome.nix
    ./services/plex.nix
    ./services/incus.nix
    ./services/nfs.nix
    ./services/samba.nix
    ./services/tailscale.nix
    ./services/radarr.nix
    ./services/sonarr.nix
    ./services/prowlarr.nix
    ./services/sabnzbd.nix
  ];
}
