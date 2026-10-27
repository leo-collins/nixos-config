{ ... }:

{
  services.beszel.agent = {
    enable = true;
    openFirewall = true;

    environment = {
      LISTEN = "45876";  # listen port
      # public key
      KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICQuCyxAOtrx1oruhEvrXDvgORmtO+FelBIbFGlX863H";
    };
  };
}
