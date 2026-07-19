{ ... }:

{
  boot.supportedFilesystems = [ "zfs" ];

  services.zfs.autoScrub = {
    enable = true;
    pools = [ "tank" ];
  };

  boot.zfs.extraPools = [ "tank" ];

  boot.zfs.forceImportRoot = false;
}
