{ lib, ... }:

{
  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media";

    settings = {
      server = {
        port = 7878;
      };
    };
  };

  # Make newly created files be writable by `media`
  # have to use mkForce since it is set to 0022 in the radarr module
  systemd.services.radarr.serviceConfig.UMask = lib.mkForce "0002";
}
