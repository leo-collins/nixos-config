{ ... }:

{
  imports = [
    ./plex.nix
    ./sonarr.nix
    ./radarr.nix
    ./sabnzbd.nix
    ./prowlarr.nix
  ];

  # create a media group to own media directories
  # radarr/sonarr/sabnzbd users will be in this group
  users.groups.media = {};
  users.users.leo.extraGroups = [ "media" ];
}
