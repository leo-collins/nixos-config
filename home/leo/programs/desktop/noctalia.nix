{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    package = pkgs.noctalia;

    settings = {
      shell.font_family = "sans-serif";
    };
  };
}
