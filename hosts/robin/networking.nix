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
      wifi-security.key-mgmt = "wpa-psk";
      ipv4.method = "auto";
      ipv6.method = "auto";
    };

    secrets.entries = [{
      matchId = "shark-5G";
      matchSetting = "802-11-wireless-security";
      key = "psk";
      file = config.sops.secrets.shark_5g_password.path;
    }];
  };

  sops.secrets.shark_5g_password = {};
}
