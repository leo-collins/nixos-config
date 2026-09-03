{ pkgs, ... }:

{
  home-manager.users.leo.home.packages = [ pkgs.wtype ];

  home-manager.users.leo.programs.niri.settings.input.keyboard.xkb = {
    model = "applealu_iso";
    layout = "gb";
    variant = "";
  };

  home-manager.users.leo.programs.niri.settings.binds."Alt+3" = {
    action.spawn = [ "wtype" "#" ];
    hotkey-overlay.hidden = true;
  };

  home-manager.users.leo.programs.niri.settings.outputs = {
    # main monitor
    "HP Inc. HP 527pq VNG60605PG" = {
      mode = {
        width = 2560;
        height = 1440;
      };
      scale = 1.0;
      transform = {
        rotation = 0;
        flipped = false;
      };
      position = {
        x = 0;
        y = 0;
      };
      focus-at-startup = true;
    };

    # second monitor to the left of the main monitor.
    "HP Inc. HP E24q G4 CNK2310V7N" = {
      mode = {
        width = 2560;
        height = 1440;
      };
      scale = 1.0;
      transform = {
        rotation = 0;
        flipped = false;
      };
      position = {
        x = -2560;
        y = 0;
      };
    };
  };
}
