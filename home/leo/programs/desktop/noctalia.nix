{ pkgs, ... }:

{
  programs.noctalia = {
    enable = true;
    package = pkgs.noctalia;

    settings = {
      shell.font_family = "sans-serif";

      theme = {
        source = "builtin";
        builtin = "Gruvbox";
      };

      wallpaper = {
        directory = "/home/leo/Pictures/Wallpapers";
        automation = {
          enabled = true;
          interval_seconds = 14400;
        };
      };

      dock = {
        enabled = true;
        auto_hide = false;
        smart_auto_hide = true;
        reserve_space = false;
        show_dots = true;
        show_instance_count = false;
      };

      location.auto_locate = true;

      bar.default = {
        thickness = 28;
        scale = 1.05;
      };

      widget.clock.format = "{:%H:%M} - {:%F (%a)}";
      idle.behavior = {
        lock = {
          enabled = true;
          timeout = 600;
          action = "lock";
        };
        "screen-off" = {
          enabled = true;
          timeout = 660;
          action = "screen_off";
        };
      };
    };
  };
}
