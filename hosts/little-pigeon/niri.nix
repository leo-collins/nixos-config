{ lib, pkgs, ... }:

{
  # Keychron K1 ISO keyboard
  services.xserver.xkb = {
    extraLayouts.keychron_k1 = {
      description = "Keychron K1 UK layout";
      languages = [ "eng" ];
      symbolsFile = pkgs.writeText "keychron-k1-xkb" ''
        partial alphanumeric_keys
        xkb_symbols "keychron_k1" {
          // Use the UK Mac symbol positions used by the K1's Mac layer.
          include "gb(mac)"

          // The K1 reports these two ISO positions in reverse order.
          key <TLDE> { [ grave,   asciitilde ] };
          key <LSGT> { [ section, plusminus  ] };
        };
      '';
    };
    model = "pc105";
    layout = lib.mkForce "keychron_k1";
    variant = lib.mkForce "";
  };

  home-manager.users.leo.home.packages = [ pkgs.wtype ];

  home-manager.users.leo.programs.niri.settings.input.keyboard.xkb = {
    model = "pc105";
    layout = "keychron_k1";
    variant = "";
  };

  home-manager.users.leo.programs.niri.settings.binds."Alt+3" = {
    action.spawn = [ "wtype" "#" ];
    hotkey-overlay.hidden = true;
  };

  home-manager.users.leo.programs.niri.settings.outputs = {
    # ultrawide monitor
    "Dell Inc. DELL S3422DWG GL6SS63" = {
      mode = {
        width = 3440;
        height = 1440;
        refresh = 119.991;
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
  };
}
