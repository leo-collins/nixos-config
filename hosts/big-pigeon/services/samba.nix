{ ... }:

{
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        security = "user";
        "map to guest" = "Never";
        "server min protocol" = "SMB3";
      };
      games = {
        path = "/tank/games";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "leo";
        "force group" = "leo";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      photos = {
        path = "/tank/photos";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "leo";
        "force group" = "leo";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      music = {
        path = "/tank/music";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "leo";
        "force group" = "leo";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      books = {
        path = "/tank/books";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "leo";
        "force group" = "leo";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      documents = {
        path = "/tank/documents";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "leo";
        "force group" = "leo";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
      misc-storage = {
        path = "/tank/misc-storage";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "leo";
        "force group" = "leo";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };
}
