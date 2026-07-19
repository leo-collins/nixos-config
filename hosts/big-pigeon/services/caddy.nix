{ config, ... }:

{
  security.acme = {
    acceptTerms = true;
    defaults.email = "collins.leo@proton.me";

    certs."int.big-pigeon.com" = {
      domain = "*.int.big-pigeon.com";
      dnsProvider = "cloudflare";
      credentialFiles = {
        CLOUDFLARE_DNS_API_TOKEN_FILE = 
          config.sops.secrets.cloudflare_dns_api_token.path;
        };
        group = "caddy";
      };
    };

  services.caddy = {
    enable = true;
    openFirewall = true;

    virtualHosts."music.int.big-pigeon.com" = {
      useACMEHost = "int.big-pigeon.com";
      extraConfig = "reverse_proxy 127.0.0.1:4533";
    };
  };

  sops.secrets.cloudflare_dns_api_token = {};
}
