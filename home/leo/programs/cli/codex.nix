{ pkgs, lib, ... }:

let
  codexConfig = (pkgs.formats.toml { }).generate "codex-config.toml" {
    mcp_servers.nixos.command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
  };
in {
  programs.codex = {
    enable = true;
    enableMcpIntegration = true;
  };

  home.activation.makeCodexConfigWritable =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      config_file="$HOME/.codex/config.toml"

      # convert old home manager symlink into a normal file
      if [ -L "$config_file" ]; then
        $DRY_RUN_CMD rm -f "$config_file"
      fi

      # seed defaults once
      if [ ! -e "$config_file" ]; then
        $DRY_RUN_CMD mkdir -p "$HOME/.codex"
        $DRY_RUN_CMD cp ${codexConfig} "$config_file"
      fi
    '';
}
