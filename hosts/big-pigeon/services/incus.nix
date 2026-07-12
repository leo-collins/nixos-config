{ ... }:

{
  virtualisation.incus = {
    enable = true;

    preseed = {
      config = {
        "core.https_address" = "127.0.0.1:8443";
      };

      storage_pools = [
        {
          name = "tank";
          driver = "zfs";
          config = {
            source = "tank/incus";
          };
        }
      ];

      networks = [
        {
          name = "incusbr0";
          type = "bridge";
          config = {
            "ipv4.address" = "auto";
            "ipv6.address" = "none";
          };
        }
      ];

      profiles = [
        {
          name = "default";
          devices = {
            root = {
              type = "disk";
              path = "/";
              pool = "tank";
            };
            eth0 = {
              type = "nic";
              name = "eth0";
              nictype = "bridged";
              parent = "br0";
            };
          };
        }
      ];
    };
  };

  # provide leo with non-root access to incus
  users.users.leo.extraGroups = [ "incus-admin" ];

  # start incus after the zfs pool has been imported
  systemd.services.incus = {
    after = [ "zfs-import-tank.service" ];
    requires = [ "zfs-import-tank.service" ];
  };
}
