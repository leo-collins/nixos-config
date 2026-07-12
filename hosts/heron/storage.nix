{ ... }:

let
  bigPigeon = "192.168.0.21";
  nfsOptions = [
    "nfsvers=4.2"
    "x-systemd.automount"
    "noauto"
    "nofail"
    "x-systemd.idle-timeout=600"
    "x-systemd.device-timeout=5s"
  ];
in
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

  fileSystems."/mnt/big-pigeon/photos" = {
    device = "${bigPigeon}:/photos";
    fsType = "nfs";
    options = nfsOptions;
  };

  fileSystems."/mnt/big-pigeon/games" = {
    device = "${bigPigeon}:/games";
    fsType = "nfs";
    options = nfsOptions;
  };
}
