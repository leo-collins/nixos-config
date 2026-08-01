{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.mcp-nixos
  ];

  programs.mcp = {
    enable = true;

    servers.nixos = {
      command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
    };
  };

  programs.codex = {
    enable = true;
    enableMcpIntegration = true;

    settings = {
      model = "gpt-5.6-sol";
      model_reasoning_effort = "medium";

      projects = {
        "${config.home.homeDirectory}".trust_level = "trusted";
        "${config.home.homeDirectory}/nixos".trust_level = "trusted";
      };

      tui = {
        session_picker_view = "comfortable";

        model_availability_nux = {
          "gpt-5.5" = 4;
        };
      };

      features.memories = true;
    };
  };

  home.file.".codex/config.toml".force = true;
}
