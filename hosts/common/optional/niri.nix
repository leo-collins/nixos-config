{ inputs, pkgs, ... }:

{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;

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
