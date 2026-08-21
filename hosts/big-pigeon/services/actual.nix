{ ... }:

{
  services.actual = {
    enable = true;
    openFirewall = true;
    settings = {
      port = 3000;
    };
  };

  services.caddy.virtualHosts."budget.int.big-pigeon.com" = {
    useACMEHost = "int.big-pigeon.com";
    extraConfig = "reverse_proxy 127.0.0.1:3000";
  };
}
