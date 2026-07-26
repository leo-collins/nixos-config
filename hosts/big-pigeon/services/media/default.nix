{ ... }:

{
  imports = [
    ./group.nix
    ./plex.nix
    ./sonarr.nix
    ./radarr.nix
    ./sabnzbd.nix
    ./prowlarr.nix
    ./recyclarr.nix
  ];

  # radarr/sonarr/sab/slskd users are all members of the shared media group.
  users.users.leo.extraGroups = [ "media" ];
  users.users.plex.extraGroups = [ "media" ];

  # New directories under the Soulseek download tree inherit `media`.
  # File creation remains governed by slskd's 0002 service umask.
  systemd.tmpfiles.rules = [
    "d /tank/misc-storage/music 2775 - media -"
  ];
}
