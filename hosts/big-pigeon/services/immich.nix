{ ... }:

{
  services.immich = {
    enable = true;
    mediaLocation = "/tank/photos/immich";
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;
  };

  services.caddy.virtualHosts."photos.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:2283";
  };
}
