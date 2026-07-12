{ ... }:

{
  services.immich = {
    enable = true;
    mediaLocation = "/tank/photos/immich";
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;
  };
}
