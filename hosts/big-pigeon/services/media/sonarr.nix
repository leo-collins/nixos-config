{ lib, ... }:

{
  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media";

    settings = {
      server = {
        port = 8989;
      };
    };
  };

  # Make newly created files be writable by `media`
  # have to use mkForce since it is set to 0022 in the sonarr module
  systemd.services.sonarr.serviceConfig.UMask = lib.mkForce "0002";
}
