{ config, pkgs, ... }:

let
  frigateConfig = (pkgs.formats.yaml {}).generate "frigate.yml" {
    version = "0.18-0";
    mqtt = {
      enabled = true;
      host = "192.168.1.30";
      port = 1883;
      user = "{FRIGATE_MQTT_USER}";
      password = "{FRIGATE_MQTT_PASSWORD}";
      client_id = "frigate-big-pigeon";
      topic_prefix = "frigate";
    };

    # Caddy provides HTTPS; Frigate still authenticates requests on port 8971.
    tls.enabled = false;
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
      path = "/openvino-model/ssdlite_mobilenet_v2.xml";
      labelmap_path = "/openvino-model/coco_91cl_bkgr.txt";
    };

    # The upstream image includes go2rtc. Share its camera connections between
    # recording, detection, and full-quality live view.
    go2rtc = {
      streams = {
        tapo_c230 = [
          "rtsp://{FRIGATE_TAPO_USER}:{FRIGATE_TAPO_PASSWORD}@192.168.1.145:554/stream1"
          "ffmpeg:tapo_c230#audio=aac"
        ];
        tapo_c230_sub = [
          "rtsp://{FRIGATE_TAPO_USER}:{FRIGATE_TAPO_PASSWORD}@192.168.1.145:554/stream2"
        ];
      };
      webrtc.candidates = [ "192.168.1.21:8555" ];
    };

    cameras.tapo_c230 = {
      live.streams = {
        "Main stream" = "tapo_c230";
        "Substream" = "tapo_c230_sub";
      };
      ffmpeg.inputs = [
        {
          path = "rtsp://127.0.0.1:8554/tapo_c230";
          input_args = "preset-rtsp-restream";
          roles = [ "record" ];
        }
        {
          path = "rtsp://127.0.0.1:8554/tapo_c230_sub";
          input_args = "preset-rtsp-restream";
          roles = [ "detect" ];
        }
      ];
      detect = {
        enabled = true;
        fps = 5;
      };
      record = {
        enabled = true;
        continuous.days = 0;
        motion.days = 7;
        alerts.retain.days = 7;
        detections.retain.days = 7;
      };
    };
  };
in
{
  sops.secrets.frigate_mqtt_env.restartUnits = [ "docker-frigate.service" ];
  sops.secrets.frigate_tapo_env.restartUnits = [ "docker-frigate.service" ];

  virtualisation.oci-containers = {
    backend = "docker";
    containers.frigate = {
      # Version and digest pin the upstream image independently of nixpkgs.
      image = "ghcr.io/blakeblackshear/frigate:0.18.2@sha256:fd60f99ffd4eb6c42360ed4e14953e270586f239309ab3983e55b2e97ffac09a";
      environment = {
        LIBVA_DRIVER_NAME = "iHD";
        TZ = "Europe/London";
      };
      environmentFiles = [
        config.sops.secrets.frigate_mqtt_env.path
        config.sops.secrets.frigate_tapo_env.path
      ];
      devices = [ "/dev/dri/renderD128:/dev/dri/renderD128" ];
      volumes = [
        "/var/lib/frigate-docker:/config"
        "/tank/nvr:/media/frigate"
        "${frigateConfig}:/config/config.yml:ro"
      ];
      ports = [
        "127.0.0.1:8971:8971"
        "192.168.1.21:8555:8555/tcp"
        "192.168.1.21:8555:8555/udp"
        "192.168.1.21:8971:8971/tcp"  # Home assistant integration
        "192.168.1.21:8554:8554/tcp"  # live video
      ];
      extraOptions = [
        "--shm-size=512m"
        "--mount=type=tmpfs,target=/tmp/cache,tmpfs-size=1000000000"
        "--stop-timeout=30"
      ];
    };
  };

  systemd.services.docker-frigate = {
    requires = [ "zfs-import-tank.service" "zfs-mount.service" ];
    after = [ "zfs-import-tank.service" "zfs-mount.service" ];
    unitConfig.RequiresMountsFor = [ "/tank/nvr" ];
    serviceConfig = {
      StateDirectory = "frigate-docker";
      StateDirectoryMode = "0750";
      # Refuse to write footage to the root disk if tank is unavailable.
      ExecStartPre = [ "${pkgs.util-linux}/bin/mountpoint -q /tank" ];
    };
  };

  services.caddy.virtualHosts."frigate.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:8971";
  };
}
