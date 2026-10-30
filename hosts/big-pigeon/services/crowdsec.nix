{ config, lib, ... }:

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

    # exempt local LAN and tailscale ip addresses
    systemd.services.crowdsec.postStart = ''
      cscli=${lib.getExe' config.services.crowdsec.package "cscli"}
      if "$cscli" allowlists inspect nixos-local-networks >/dev/null 2>&1; then
        "$cscli" allowlists delete nixos-local-networks
      fi
      "$cscli" allowlists create nixos-local-networks \
        --description "LAN and Tailscale networks managed by NixOS"
      "$cscli" allowlists add nixos-local-networks \
        192.168.1.0/24 \
        100.64.0.0/10 \
        fd7a:115c:a1e0::/48
    '';

    # Restart enforcement after CrowdSec and its allowlist are ready.
    systemd.services.crowdsec-firewall-bouncer = {
      partOf = [ "crowdsec.service" ];
      serviceConfig = {
        Restart = "on-failure";
        RestartSec = "10s";
      };
    };

    # an nftables reload will clear crowdsec's blocked IP sets
    systemd.services.nftables.reloadIfChanged = lib.mkForce false;

    systemd.services.crowdsec-setup.serviceConfig = {
      Restart = "on-failure";
      RestartSec = "30s";
    };
  };
}
