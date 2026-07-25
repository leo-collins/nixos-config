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
  # Remember to add the share to hosts/big-pigeon/services/nfs.nix
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

  fileSystems."/mnt/big-pigeon/misc-storage" = {
    device = "${bigPigeon}:/misc-storage";
    fsType = "nfs";
    options = nfsOptions;
  };
}
