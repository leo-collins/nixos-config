{ ... }:

{
  services.radarr = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        port = 7878;
      };
    };
  };
}
