{ config, lib, ... }:

let
  proxy = config.services.tailscaleProxy;
in
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
    # Mullvad does not support forwarded ports. Keeping the Soulseek port
    # closed also prevents incoming connections from bypassing the proxy.
    openFirewall = false;
    environmentFile = config.sops.templates."slskd.env".path;
    settings = {
      web = {
        port = 5030;
      };
      shares.directories = [ "/tank/music" ];
      directories = {
        downloads = "/tank/music-downloads/complete";
        incomplete = "/tank/music-downloads/incomplete";
      };
      global = {
        upload = {
          slots = 2;
          speed_limit = 1024;  #KiB/s
        };
      };
      soulseek.connection.proxy = {
        enabled = proxy.enable;
        address = proxy.listenAddress;
        port = proxy.port;
      };
    };
  };

  # openFirewall only opens the Soulseek port, and not the webui port
  # networking.firewall.allowedTCPPorts = [ 5030 ];

  systemd.services.slskd = {
    requires = lib.optional proxy.enable "tailscale-proxy.service";
    after = lib.optional proxy.enable "tailscale-proxy.service";
    serviceConfig.UMask = "0002";
  };
}
