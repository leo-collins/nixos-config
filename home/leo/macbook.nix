{ config, ... }:

# Home manager profile for imperial macbook

{
  imports = [
    ./global
    ./programs/desktop/alacritty.nix
    ./programs/desktop/iina.nix
  ];

  home = {
    username = "lac224";
    homeDirectory = "/Users/lac224";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  programs = {
    codex.settings.projects = {
      "${config.home.homeDirectory}/Coding/work/firedrake-dev".trust_level = "trusted";
      "${config.home.homeDirectory}/Coding/work/firedrake-dev-int64".trust_level = "trusted";
      "${config.home.homeDirectory}/Coding/work/firedrake-dev-complex".trust_level = "trusted";
    };
  };
}
