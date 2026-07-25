{ pkgs, ... }:

let
  # beets-audible 1.6.0 pins uv-build below 0.11, while nixpkgs provides 0.11.16. 
  beetsAudiblePatched = pkgs.python3Packages.beets-audible.overrideAttrs (old: {
    doCheck = false;
    postPatch = (old.postPatch or "") + ''
      substituteInPlace pyproject.toml \
        --replace-fail "uv_build>=0.10.0,<0.11.0" "uv-build"
    '';
  });
in
{
  programs.beets = {
    enable = true;

    # Filetote moves non-audio files with the album being imported.
    package = pkgs.python3Packages.beets.override {
      pluginOverrides.filetote = {
        enable = true;
        propagatedBuildInputs = [
          (pkgs.python3Packages.beets-filetote.override {
            beets-audible = beetsAudiblePatched;
          })
        ];
      };
    };

    settings = {
      directory = "/tank/music";
      library = "/home/leo/Documents/beets.db";
      import = {
        move = true;
        write = true;  # For writing tags
        from_scratch = true;  # Discard all existing tags
      };

      plugins = [
        "musicbrainz"
        "filetote"
        "inline"
        "scrub"
      ];

      paths.default = "$albumartist/($release_date) $album%if{$catalog_or_barcode, {$catalog_or_barcode$}}%if{$media, [$media]}/$disc-$track_2 - %left{$title,64}";

      # The inline plugin reads these fields from the top level of config.yaml.
      item_fields.track_2 = "f'{track:02d}'";
      album_fields = {
        release_date = "f'{year:04d}-{month:02d}-{day:02d}' if year and month and day else str(year or '')";
        catalog_or_barcode = "catalognum if catalognum and catalognum.lower() != '[none]' else (barcode or '')";
      };

      filetote.extensions = [ ".jpg" ".jpeg" ".png" ".log" ".cue" ];

      # Delete all existing tag containers
      scrub.auto = true;
    };
  };
}
