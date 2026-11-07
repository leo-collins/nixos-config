{ config, pkgs, ... }:

{
  # MQTT credentials
  sops.secrets.frigate_mqtt_env = {
    restartUnits = [ "frigate.service" ];
  };

  # Tapo camera account
  sops.secrets.frigate_tapo_env = {
    restartUnits = [ "frigate.service" ];
  };

  services.frigate = {
    enable = true;
    hostname = "frigate.int.big-pigeon.com";
    vaapiDriver = "iHD";

    # Config validation needs substitutes for the runtime credentials.
    preCheckConfig = ''
      export FRIGATE_MQTT_USER=check
      export FRIGATE_MQTT_PASSWORD=check
      export FRIGATE_TAPO_USER=check
      export FRIGATE_TAPO_PASSWORD=check
    '';

    settings = {
      mqtt = {
        enabled = true;
        host = "192.168.1.30";
        port = 1883;
        user = "{FRIGATE_MQTT_USER}";
        password = "{FRIGATE_MQTT_PASSWORD}";
        client_id = "frigate-big-pigeon";
        topic_prefix = "frigate";
      };

      ffmpeg.hwaccel_args = "preset-vaapi";
      detectors.ov = {
        type = "openvino";
        device = "GPU";
      };

      model = {
        width = 300;
        height = 300;
        input_tensor = "nhwc";
        input_pixel_format = "bgr";
        # The pinned nixpkgs model's .model attribute misspells this filename.
        path = "${pkgs.frigate.models.openvino.ssdlite_mobilenet_v2_coco}/ssdlite_mobilenet_v2.xml";
        labelmap_path = pkgs.frigate.models.openvino.ssdlite_mobilenet_v2_coco.labelmap;
      };

      cameras.tapo_c230 = {
        ffmpeg.inputs = [
          {
            path = "rtsp://{FRIGATE_TAPO_USER}:{FRIGATE_TAPO_PASSWORD}@192.168.1.145:554/stream1";
            roles = [ "record" ];
          }
          {
            path = "rtsp://{FRIGATE_TAPO_USER}:{FRIGATE_TAPO_PASSWORD}@192.168.1.145:554/stream2";
            roles = [ "detect" ];
          }
        ];
        detect = {
          enabled = true;
          fps = 5;
        };
        record = {
          enabled = true;
          motion.days = 7;
          alerts.retain.days = 7;
          detections.retain.days = 7;
        };
      };
    };
  };

  systemd.services.frigate.serviceConfig.EnvironmentFile = [
    config.sops.secrets.frigate_mqtt_env.path
    config.sops.secrets.frigate_tapo_env.path
  ];

  # Frigate's NixOS module needs nginx
  services.nginx.virtualHosts."frigate.int.big-pigeon.com".listen = [
    { addr = "127.0.0.1"; port = 8971; }
  ];

  services.caddy.virtualHosts."frigate.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:8971";
  };
}
