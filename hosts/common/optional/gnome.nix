{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    wl-clipboard  # cli clipboard utils for wayland
  ];

  programs.dconf.enable = true;

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  console.keyMap = "uk";
  services.printing.enable = true;
}
