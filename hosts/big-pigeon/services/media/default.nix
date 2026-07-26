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
}
