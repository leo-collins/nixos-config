{ ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  console.keyMap = "uk";

  services.printing.enable = true;
}
