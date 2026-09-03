{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "26.05";

  # apple aluminium keyboard a1243
  services.xserver.xkb = {
    model = "applealu_iso";
    options = "terminate:ctrl_alt_bksp,lv3:lalt_switch";
  };
}
