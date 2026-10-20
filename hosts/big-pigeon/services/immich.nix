{ ... }:

{
  services.immich = {
    enable = true;
    mediaLocation = "/tank/photos/immich";
    port = 2283;
    host = "0.0.0.0";
    openFirewall = true;
    accelerationDevices = [ "/dev/dri/renderD128" ];
    settings = {
      ffmpeg = {
        accel = "vaapi";
        accelDecode = true;
        preferredHwDevice = "/dev/dri/renderD128";
      };
    };
  };

  users.users.immich.extraGroups = [ "render" ];

  services.caddy.virtualHosts."photos.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:2283";
  };
}
