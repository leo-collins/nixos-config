{ config, ... }:

{
  sops.secrets = {
    slskd_slsk_username = {};
    slskd_slsk_password = {};
  };

  sops.templates."slskd.env" = {
    owner = config.services.slskd.user;
    mode = "0400";
    restartUnits = [ "slskd.service" ];

    content = ''
      SLSKD_SLSK_USERNAME=${config.sops.placeholder.slskd_slsk_username}
      SLSKD_SLSK_PASSWORD=${config.sops.placeholder.slskd_slsk_password}
    '';
  };

  services.slskd = {
    enable = true;
    group = "media";
    openFirewall = true;
    environmentFile = config.sops.templates."slskd.env".path;
    settings = {
      web = {
        port = 5030;
      };
      shares.directories = [ "/tank/music" ];
      directories = {
        downloads = "/tank/misc-storage/music/complete";
        incomplete = "/tank/misc-storage/music/incomplete";
      };
      global = {
        upload = {
          slots = 2;
          speed_limit = 1024;  #KiB/s
        };
      };
    };
  };

  # openFirewall only opens the Soulseek port, and not the webui port
  networking.firewall.allowedTCPPorts = [ 5030 ];

  systemd.services.slskd.serviceConfig.UMask = "0002";
}

