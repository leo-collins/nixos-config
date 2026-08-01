{ config, lib, pkgs, ... }:

let
  cfg = config.services.tailscaleProxy;
in
{
  options.services.tailscaleProxy = {
    enable = lib.mkEnableOption "a dedicated Tailscale SOCKS5 egress proxy";

    listenAddress = lib.mkOption {
      type = lib.types.str;
      default = "127.0.0.1";
      description = ''
        Address on which the unauthenticated SOCKS5 proxy listens. Keep this
        on a loopback address unless access is restricted by other means.
      '';
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 1055;
      description = "Port on which the SOCKS5 proxy listens.";
    };
  };

  config = lib.mkMerge [
    { services.tailscaleProxy.enable = lib.mkDefault true; }

    (lib.mkIf cfg.enable {
      systemd.services.tailscale-proxy = {
        description = "Dedicated Tailscale SOCKS5 egress proxy";
        wantedBy = [ "multi-user.target" ];
        wants = [ "network-online.target" ];
        after = [ "network-online.target" ];

        serviceConfig = {
          StateDirectory = "tailscale-proxy";
          RuntimeDirectory = "tailscale-proxy";
          ExecStart = ''
            ${pkgs.tailscale}/bin/tailscaled \
              --tun=userspace-networking \
              --state=/var/lib/tailscale-proxy/tailscaled.state \
              --socket=/run/tailscale-proxy/tailscaled.sock \
              --socks5-server=${cfg.listenAddress}:${toString cfg.port} \
              --port=0
          '';
          Restart = "on-failure";
          RestartSec = 5;
        };
      };
    })
  ];
}
