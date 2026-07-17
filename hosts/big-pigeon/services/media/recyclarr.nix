{ config, ... }:

{
  services.recyclarr = {
    enable = true;
    schedule = "daily";
    command = "sync";

    configuration = {
      radarr.movies = {
        base_url = "http://localhost:7878";
        api_key = {
          _secret = config.sops.secrets.radarr_api_key.path;
        };

        delete_old_custom_formats = true;

        quality_definition = {
          type = "movie";
        };

        quality_profiles = [
          {
            trash_id = "fd161a61e3ab826d3a22d53f935696dd"; # Remux + WEB 2160p
            reset_unmatched_scores.enabled = true;
          }
          {
            trash_id = "9ca12ea80aa55ef916e3751f4b874151"; # Remux + WEB 1080p
            reset_unmatched_scores.enabled = true;
          }
        ];
      };

      sonarr.tv = {
        base_url = "http://localhost:8989";
        api_key = {
          _secret = config.sops.secrets.sonarr_api_key.path;
        };

        quality_definition = {
          type = "series";
        };

        quality_profiles = [
          {
            trash_id = "d1498e7d189fbe6c7110ceaabb7473e6"; # WEB-2160p
            reset_unmatched_scores.enabled = true;
          }
          {
            trash_id = "72dae194fc92bf828f32cde7744e51a1"; # WEB-1080p
            reset_unmatched_scores.enabled = true;
          }
        ];
      };
    };
  };
}
