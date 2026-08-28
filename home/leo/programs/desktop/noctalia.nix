{ pkgs, ... }:

{
  programs.noctalia = {
    enable = true;
    package = pkgs.noctalia;

    settings = {
      shell.font_family = "sans-serif";
    };
  };
}
