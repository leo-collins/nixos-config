{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  console.keyMap = "uk";
  services.printing.enable = true;
}
