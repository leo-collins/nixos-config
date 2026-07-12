{ ... }:

{
  services.nfs = {
    server = {
      enable = true;

      exports = ''
        /tank        192.168.0.0/24(ro,fsid=0,crossmnt,no_subtree_check)
        /tank/photos 192.168.0.0/24(rw,sync,no_subtree_check,all_squash,anonuid=1000,anongid=1000)
        /tank/games  192.168.0.0/24(rw,sync,no_subtree_check,all_squash,anonuid=1000,anongid=1000)
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [ 2049 ];

  systemd.services.nfs-server = {
    after = [ "zfs-import-tank.service" ];
    requires = [ "zfs-import-tank.service" ];
  };
}
