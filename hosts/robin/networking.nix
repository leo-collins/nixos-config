{ config, ... }:

{
  networking.hostName = "robin";

  networking.networkmanager.ensureProfiles = {
    profiles.shark-5G = {
      connection = {
        id = "shark-5G";
        type = "wifi";
        autoconnect = true;
        autoconnect-priority = 10;
      };
      wifi = {
        mode = "infrastructure";
        ssid = "Shark-5G";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "$SHARK_5G_PASSWORD";
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
    };

    environmentFiles = [ config.sops.templates."network-manager.env".path ];
  };

  sops.secrets.shark_5g_password = {};
  sops.templates."network-manager.env".content = ''
    SHARK_5G_PASSWORD="${config.sops.placeholder.shark_5g_password}"
  '';
}
