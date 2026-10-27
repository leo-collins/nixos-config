{ ... }:

{
  services.beszel.hub = {
    enable = true;
    host = "127.0.0.1";
    port = 8090;
    environment.APP_URL = "https://beszel.int.big-pigeon.com";
  };

  services.caddy.virtualHosts."beszel.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:8090";
  };
}
