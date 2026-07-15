{ ... }:

{
  services.sonarr = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        port = 8989;
      };
    };
  };
}
