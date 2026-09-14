{ lib, pkgs, ... }:

let
  greeterCommand = lib.concatStringsSep " " [
    "${pkgs.systemd}/bin/systemd-inhibit"
    "--what=idle:sleep"
    "--who=noctalia-greeter"
    "--why=login-screen"
    "--mode=block"
    "${pkgs.noctalia-greeter}/bin/noctalia-greeter-session"
    "--"
  ];
in
{
  services.displayManager.gdm.enable = lib.mkForce false;

  programs.noctalia-greeter.settings = {
    session.default = lib.mkForce "GNOME";
    output = {
      width = 3840;
      height = 2160;
      scale = 2.0;
    };
  };

  services.greetd.settings.default_session.command = lib.mkForce greeterCommand;
}
