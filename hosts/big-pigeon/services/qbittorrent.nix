{ config, lib, pkgs, ... }:

let
  proxy = config.services.tailscaleProxy;
in
{
  services.qbittorrent = {
    enable = true;
    group = "media";
    webuiPort = 8081;
    openFirewall = false;

    serverConfig = {
      LegalNotice.Accepted = true;

      Network = {
        PortForwardingEnabled = false;
        Proxy = {
          Type = 2; # SOCKS5
          IP = proxy.listenAddress;
          Port = proxy.port;
          AuthEnabled = false;
          HostnameLookupEnabled = true;
          Profiles = {
            BitTorrent = true;
            RSS = true;
            Misc = true;
          };
        };
      };

      BitTorrent.Session = {
        AnonymousModeEnabled = true;
        DHTEnabled = true;
        LSDEnabled = false;
        PeXEnabled = true;
        ProxyPeerConnections = true;

        DefaultSavePath = "/tank/media/torrents/complete";
        TempPath = "/tank/media/torrents/incomplete";
        TempPathEnabled = true;

        GlobalUPSpeedLimit = 1000;  # 1000 KiB/s
      };

      Preferences.WebUI = {
        Address = "127.0.0.1";
        Port = 8081;
        UseUPnP = false;

        Username = "leo";
        # The password is a SHA512 PBKDF2 hash stored in sops. It base64 and has
        # the form salt:hash
        Password_PBKDF2 = "@ByteArray(@QBITTORRENT_WEBUI_PASSWORD_HASH@)";

        HostHeaderValidation = true;
        ServerDomains = "qbittorrent.int.big-pigeon.com;localhost;127.0.0.1";
        ReverseProxySupportEnabled = true;
        TrustedReverseProxiesList = "127.0.0.1;::1";
        SecureCookie = true;
      };
    };
  };

  services.caddy.virtualHosts."qbittorrent.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:8081";
  };

  sops.secrets = {
    qbittorrent_webui_password_hash = {
      owner = config.services.qbittorrent.user;
      group = config.services.qbittorrent.group;
      mode = "0400";
      restartUnits = [ "qbittorrent.service" ];
    };
  };

  systemd.services.qbittorrent = {
    requires = lib.optional proxy.enable "tailscale-proxy.service";
    after = lib.optional proxy.enable "tailscale-proxy.service";

    serviceConfig = {
      UMask = "0002";

      # Fail closed: qBittorrent may only reach Caddy and the SOCKS5 proxy on
      # loopback. It cannot fall back to big-pigeon's normal network route.
      IPAddressDeny = [ "any" ];
      IPAddressAllow = [ "localhost" ];

      # Replace placeholder password
      ExecStartPre = lib.mkAfter [
        ''
          ${lib.getExe pkgs.replace-secret} \
            '@QBITTORRENT_WEBUI_PASSWORD_HASH@' \
            '${config.sops.secrets.qbittorrent_webui_password_hash.path}' \
            '/var/lib/qBittorrent/qBittorrent/config/qBittorrent.conf'
        ''
      ];
    };
  };
}
