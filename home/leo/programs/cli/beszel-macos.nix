{ config, pkgs, ... }:

# beszel agent config for macos hosts using home manager.

{
    home.packages = [ pkgs.beszel ];

    launchd.agents.beszel-agent = {
      enable = true;

      config = {
        ProgramArguments = [ "${pkgs.beszel}/bin/beszel-agent" ];
        RunAtLoad = true;
        KeepAlive = true;

        EnvironmentVariables = {
          KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICQuCyxAOtrx1oruhEvrXDvgORmtO+FelBIbFGlX863H";
          LISTEN = "45876";
          DATA_DIR = "${config.home.homeDirectory}/Library/Application Support/beszel-agent";
        };

        StandardOutPath = "${config.home.homeDirectory}/Library/Logs/beszel-agent.log";
        StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/beszel-agent.log";
      };
    };
}
