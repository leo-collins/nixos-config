{ ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.networkmanager.ensureProfiles.profiles = {
    "living-room-nixos" = {
      connection = {
        id = "living-room-nixos";
        type = "ethernet";
        interface-name = "enp0s31f6";
        autoconnect = true;
      };

      ipv4 = {
        method = "manual";
        address1 = "192.168.0.235/24,192.168.0.1";
        dns = "9.9.9.9;1.1.1.1";
      };

      ipv6 = {
        method = "auto";
      };
    };
  };
}
