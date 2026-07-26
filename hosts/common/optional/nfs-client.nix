{ ... }:

let
  bigPigeon = "192.168.0.21";
  nfsOptions = [
    "nfsvers=4.2"
    "rw"
    "x-systemd.automount"
    "noauto"
    "nofail"
    "x-systemd.idle-timeout=600"
    "x-systemd.device-timeout=5s"
  ];
in
{
  # Remember to add shares to hosts/big-pigeon/services/nfs.nix
  # And rebuild on big-pigeon
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

  fileSystems."/mnt/big-pigeon/misc-storage/music" = {
    device = "${bigPigeon}:/misc-storage/music";
    fsType = "nfs";
    options = nfsOptions;
    depends = [ "/mnt/big-pigeon/misc-storage" ];
  };

  fileSystems."/mnt/big-pigeon/music" = {
    device = "${bigPigeon}:/music";
    fsType = "nfs";
    options = nfsOptions;
  };
}
