{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  nixpkgs.overlays = [
    inputs.nix-minecraft.overlay
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.fabric = {
      enable = true;
      
      package = pkgs.fabricServers.fabric-26_2;
    
      serverProperties = {
        # https://minecraft.wiki/w/Server.properties
        server-port = 43000;
        difficulty = "normal";
        gamemode = "survival";
        enable-rcon = true;  # allow server console access over network
      };

      jvmOpts = "-Xms4096M -Xmx6144M";
    };
  };
}
