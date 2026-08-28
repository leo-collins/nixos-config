{ lib, pkgs, ... }:

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

  # Preserve a config created by the old programs.codex module when switching
  # to a package-only setup. New configs are created and managed by Codex.
  home.activation.migrateCodexConfig =
    lib.hm.dag.entryBetween [ "linkGeneration" ] [ "writeBoundary" ] ''
      codexConfig="$HOME/.codex/config.toml"

      if [ -L "$codexConfig" ]; then
        codexConfigSource="$(readlink -e "$codexConfig")"
        run cp -- "$codexConfigSource" "$codexConfig.hm-mutable"
        run mv -- "$codexConfig.hm-mutable" "$codexConfig"
      fi
    '';
}
