{ ... }:

{
  programs.beets = {
    enable = true;
    settings = {
      directory = "/tank/music";
      library = "/home/leo/Documents/beets.db";
      import.move = true;
      plugins = [ "musicbrainz" ];
    };
  };
}
