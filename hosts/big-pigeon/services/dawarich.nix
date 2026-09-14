{ ... }:

{
  services.dawarich = {
    enable = true;
    configureNginx = false;
    webPort = 3001;
    localDomain = "dawarich.int.big-pigeon.com";
  };

  services.caddy.virtualHosts."dawarich.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:3001";
  };
}
