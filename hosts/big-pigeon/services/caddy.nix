{ ... }:

{
  services.caddy = {
    enable = true;
    openFirewall = true;

    virtualHosts."music.int.big-pigeon.com".extraConfig = ''
      tls internal
      reverse_proxy 127.0.0.1:4533
    '';
  };
}
