{ config, lib, ... }:

{
  sops.secrets.sonarr_api_key = {};

  sops.templates."sonarr.env" = {
    owner = config.services.sonarr.user;
    mode = "0400";
    restartUnits = [ "sonarr.service" ];
    content = ''
      SONARR__AUTH__APIKEY=${config.sops.placeholder.sonarr_api_key}
    '';
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media";
    environmentFiles = [
      config.sops.templates."sonarr.env".path
    ];

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
