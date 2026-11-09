{ inputs, pkgs, ... }:

{
  home.packages = [
    #pkgs.codex
    # until https://github.com/NixOS/nixpkgs/issues/585124 is resolved
    inputs.nixpkgs-codex.legacyPackages.${pkgs.stdenv.hostPlatform.system}.codex
    pkgs.mcp-nixos
  ];

  programs.mcp = {
    enable = true;

    servers.nixos = {
      command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
    };
  };
}
