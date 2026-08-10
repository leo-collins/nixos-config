{ config, ... }:

# Home manager profile for thisbe

{
  imports = [
    ./global
  ];

  home = {
    username = "lac224";
    homeDirectory = "/home/ma/l/lac224";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  # programs = {
  #   codex.settings.projects = {
  #     "${config.home.homeDirectory}/Coding/work/firedrake-dev".trust_level = "trusted";
  #     "${config.home.homeDirectory}/Coding/work/firedrake-dev-int64".trust_level = "trusted";
  #     "${config.home.homeDirectory}/Coding/work/firedrake-dev-complex".trust_level = "trusted";
  #   };
  # };
}
