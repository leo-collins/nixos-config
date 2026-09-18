{ config, ... }:

let
  hostName = config.networking.hostName;

  # Add each device once. The current host is removed below automatically.
  allDevices = {
    big-pigeon = {
      id = "36IXIPK-H6ZZLX4-HCLX4QW-KK4XKTT-5HPIP5S-U5HFXX3-K74TXD2-Q3IFSAH";
    };
    little-pigeon = {
      id = "QOXO2NN-TF7HL7Z-BHDZJQQ-5LHQBB2-NR443IV-GYGFQI5-NIPHBM5-ZSVSGQS";
    };
  };

  remoteDevices = removeAttrs allDevices [ hostName ];
in
{
  # Prevent Syncthing from creating the default ~/Sync folder.
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "127.0.0.1:8384";
    user = "leo";
    group = "leo";
    dataDir = "/home/leo";
    configDir = "/home/leo/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = remoteDevices;

      folders = {
        documents = {
          label = "Documents";
          path = {
            big-pigeon = "/tank/documents";
            little-pigeon = "/home/leo/Documents";
          }.${hostName};
          devices = builtins.attrNames remoteDevices;
        };
      };
    };
  };
}
