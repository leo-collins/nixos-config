{ ... }:

{
  fileSystems."/mnt/250gbssd" = {
    device = "/dev/disk/by-uuid/9714a901-6663-4b15-84b4-c86d491ebb71";
    fsType = "btrfs";
    options = [ "nofail" "x-systemd.device-timeout=5s" ];
  };

  fileSystems."/mnt/1tbssd" = {
    device = "/dev/disk/by-uuid/f5cbbccd-cac1-4062-9d85-48de8c917114";
    fsType = "btrfs";
    options = [ "nofail" "x-systemd.device-timeout=5s" ];
  };
}
