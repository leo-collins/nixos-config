{ ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;

    hardwareAcceleration = {
      enable = true;
      type = "vaapi";
      device = "/dev/dri/renderD128";
    };

    transcoding = {
      enableHardwareEncoding = true;
      enableIntelLowPowerEncoding = false;

      hardwareDecodingCodecs = {
        h264 = true;
        hevc = true;
        hevc10bit = true;
        mpeg2 = true;
        vc1 = true;
        vp8 = true;
        vp9 = true;
      };
      hardwareEncodingCodecs = {
        hevc = true;
      };
    };
  };

  users.users.jellyfin.extraGroups = [ "media" ];

  services.caddy.virtualHosts."jellyfin.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:8096";
  };
}
