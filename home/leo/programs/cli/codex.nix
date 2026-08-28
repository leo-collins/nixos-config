{ pkgs, ... }:

{
  home.packages = [
    pkgs.codex
    pkgs.mcp-nixos
  ];

  programs.mcp = {
    enable = true;

    servers.nixos = {
      command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
    };
  };
}
