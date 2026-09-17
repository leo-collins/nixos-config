{ config, ... }:

let
  folderPath = {
    big-pigeon = "/tank/documents";
    little-pigeon = "~/Documents";
  }.${config.networking.hostName};
in
{
  services.syncthing = {
    enable = true;
    user = "leo";
    group = "leo";
    dataDir = "/home/leo";
    openDefaultPorts = true;
    overrideDevices = false;

    settings.folders.documents = {
      id = "documents";
      path = folderPath;
    };
  };
}
