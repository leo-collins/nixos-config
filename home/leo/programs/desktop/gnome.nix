{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
      ];
      favorite-apps = [
        "zen-beta.desktop"
        "steam.desktop"
        "org.gnome.Nautilus.desktop"
        "Alacritty.desktop"
        "feishin.desktop"
      ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      dash-max-icon-size = 64;
      animation-time = 0.100;
      hide-delay = 0.000;
      custom-theme-shrink = true;
      show-trash = false;
      show-mounts = false;
    };

    "org/gnome/desktop/interface" = {
      scaling-factor = lib.gvariant.mkUint32 2;
    };
  };
}
