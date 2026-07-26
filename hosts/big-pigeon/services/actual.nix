{ ... }:

{
  services.actual = {
    enable = true;
    openFirewall = true;
    settings = {
      port = 3000;
    };
  };
}
