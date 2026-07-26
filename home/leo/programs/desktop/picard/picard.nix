{ config, pkgs, ... }:

let
  replaygain2Plugin = pkgs.fetchFromGitHub {
    owner = "metabrainz";
    repo = "picard-plugins";
    rev = "efb04f6f9834a33573deb953ec3824f8bb828e15";
    hash = "sha256-SzESA0LMGzpOJupTb2seGWBvmcZ/Dnwun4dTwXtgyXU=";
  };

  picardWithReplaygain2 = pkgs.picard.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      pluginDir=$(echo "$out"/lib/python*/site-packages/picard/plugins)
      mkdir -p "$pluginDir"
      ln -s ${replaygain2Plugin}/plugins/replaygain2 \
        "$pluginDir/replaygain2"
    '';
  });
in
{
  home.packages = [
    picardWithReplaygain2
    pkgs.rsgain
  ];

  home.file.".config/MusicBrainz/Picard.ini" = {
    source = config.lib.file.mkOutOfStoreSymlink ./Picard.ini;
    force = true;
  };
}
