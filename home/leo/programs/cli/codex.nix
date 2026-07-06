{ pkgs, ... }:

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
      projects = {
        "/home/leo".trust_level = "trusted";
        "/home/leo/nixos".trust_level = "trusted";
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
