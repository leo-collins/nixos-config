{ lib, ... }:

{
  # apply json journal logging to all caddy virtualHosts
  options.services.caddy.virtualHosts = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      logFormat = lib.mkForce ''
        output stderr
        format json
      '';
    });
  };

  config = {
    services.crowdsec = {
      enable = true;
      autoUpdateService = true;

      hub.collections = [
        "crowdsecurity/linux"
        "crowdsecurity/caddy"
      ];

      settings = {
        config.api.server = {
          listen_uri = "127.0.0.1:8086";
          online_client = {
            credentials_path =
              "/var/lib/crowdsec/data/online_api_credentials.yaml";
            sharing = true;
            pull = {
              community = true;
              blocklists = true;
            };
          };
        };

        # Read caddy and SSH logs
        acquisitions = [
          {
            source = "journalctl";
            journalctl_filter = [ "_SYSTEMD_UNIT=sshd.service" ];
            labels.type = "syslog";
          }
          {
            source = "journalctl";
            journalctl_filter = [ "_SYSTEMD_UNIT=caddy.service" ];
            labels.type = "syslog";
          }
        ];
      };
    };

    # The bouncer enforces bans
    services.crowdsec-firewall-bouncer = {
      enable = true;
      registerBouncer.enable = true;
      settings.mode = "nftables";
    };

    # an nftables reload will clear crowdsec's blocked IP sets
    systemd.services.nftables.reloadIfChanged = lib.mkForce false;

    systemd.services.crowdsec-setup.serviceConfig = {
      Restart = "on-failure";
      RestartSec = "30s";
    };

    systemd.services.crowdsec-firewall-bouncer.serviceConfig = {
      Restart = "on-failure";
      RestartSec = "10s";
    };
  };
}
