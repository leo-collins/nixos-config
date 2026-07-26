{ ... }:

{
  imports = [
    ./plex.nix
    ./sonarr.nix
    ./radarr.nix
    ./sabnzbd.nix
    ./prowlarr.nix
    ./recyclarr.nix
  ];

  # create a media group with stable gid to own media directories
  # radarr/sonarr/sab/slskd users will be in this group
  users.groups.media.gid = 986;
  users.users.leo.extraGroups = [ "media" ];
  users.users.plex.extraGroups = [ "media" ];

  # New directories under the Soulseek download tree inherit `media`.
  # File creation remains governed by slskd's 0002 service umask.
  systemd.tmpfiles.rules = [
    "d /tank/misc-storage/music 2775 - media -"
  ];
}
