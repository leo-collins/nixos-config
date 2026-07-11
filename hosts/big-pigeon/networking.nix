{ ... }:

{
  networking.hostName = "big-pigeon";
  networking.networkmanager.ensureProfiles.profiles."big-pigeon" = {
    connection = {
      id = "big-pigeon";
      type = "ethernet";
      interface-name = "eno1";
      autoconnect = true;
    };

    ipv4 = {
      method = "manual";
      address1 = "192.168.0.21/24,192.168.0.1";
      dns = "9.9.9.9;1.1.1.1";
    };

    ipv6.method = "auto";
  };
}
