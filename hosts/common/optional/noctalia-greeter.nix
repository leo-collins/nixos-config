{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;
    package = pkgs.noctalia-greeter;
    greeter-args = "";

    settings = {
      session.default = "Niri";
      keyboard.layout = "gb";
    };
  };
}
