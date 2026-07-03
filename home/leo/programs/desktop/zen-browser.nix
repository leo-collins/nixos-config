{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = let
    mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
      installation_mode = "force_installed";
      default_area = "navbar";
    });
  in {
    enable = true;

    policies.ExtensionSettings = mkExtensionSettings {
      "uBlock0@raymondhill.net" = "ublock-origin";
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "widget.dmabuf.force-enabled" = true;
      };
    };
  };
}
