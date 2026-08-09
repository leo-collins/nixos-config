{ inputs, pkgs, ... }:

# https://github.com/Infinidoge/nix-minecraft/blob/master/README.md

{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];

  nixpkgs.overlays = [
    inputs.nix-minecraft.overlay
  ];

  users.users.leo.extraGroups = [
    "minecraft"
  ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.fabric = {
      # To connect to server console, run:
      # tmux -S /run/minecraft/fabric.sock attach
      enable = true;

      autoStart = false;  # Start server with systemctl start minecraft-server-fabric
      restart = "no";
      
      package = pkgs.fabricServers.fabric-26_2.override {
        jre_headless = pkgs.jdk25_headless;
      };
    
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
