{ ... }:

{
  home-manager.users.leo.programs.niri.settings.outputs = {
    # ultrawide monitor
    "Dell Inc. DELL S3422DWG GL6SS63" = {
      mode = {
        width = 3440;
        height = 1440;
        refresh = 119.991;
      };
      scale = 1.0;
      transform = {
        rotation = 0;
        flipped = false;
      };
      position = {
        x = 0;
        y = 0;
      };
      focus-at-startup = true;
    };
  };
}
