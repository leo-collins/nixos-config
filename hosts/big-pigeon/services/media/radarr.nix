{ config, lib, ... }:

{
  sops.secrets.radarr_api_key = {};

  sops.templates."radarr.env" = {
    owner = config.services.radarr.user;
    mode = "0400";
    restartUnits = [ "radarr.service" ];
    content = ''
      RADARR__AUTH__APIKEY=${config.sops.placeholder.radarr_api_key}
    '';
  };

  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media";
    environmentFiles = [
      config.sops.templates."radarr.env".path
    ];

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
