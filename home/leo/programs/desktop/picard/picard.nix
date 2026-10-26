{ config, pkgs, ... }:

let
  replaygain2Plugin = pkgs.fetchFromGitHub {
    owner = "metabrainz";
    repo = "picard-plugin-replaygain2";
    rev = "39fbcaaa9e0caa5be91f8ef8d2497b245fd21483";
    hash = "sha256-0UhCnNFBRlzP1G4ZEOOZkP+Z1QHCoSKaOWO2l14weyM=";
  };
in
{
  home.packages = [
    pkgs.picard
    pkgs.rsgain
  ];

  xdg.dataFile."MusicBrainz/Picard/plugins3/replaygain2".source =
    replaygain2Plugin;

  home.file.".config/MusicBrainz/Picard.ini" = {
    # Use a string rather than a Nix path here.  A Nix path is copied to the
    # store during evaluation, which would make this link read-only.
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos/home/leo/programs/desktop/picard/Picard.ini";
    force = true;
  };
}
