{ pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.fira-code
  ];

  programs.alacritty = {
    enable = true;
    theme = "monokai";
    settings = {
      font = {
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        bold_italic.family = "FiraCode Nerd Font";
      };
    };
  };
}
