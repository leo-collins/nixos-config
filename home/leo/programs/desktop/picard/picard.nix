{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.picard
  ];

  home.file.".config/MusicBrainz/Picard.ini" = {
    source = config.lib.file.mkOutOfStoreSymlink ./Picard.ini;
    force = true;
  };
}
