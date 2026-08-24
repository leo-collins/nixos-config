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
  };
}
