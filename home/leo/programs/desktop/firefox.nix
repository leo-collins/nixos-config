{ ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default.settings = {
      "gfx.webrender.all" = true;
      "media.ffmpeg.vaapi.enabled" = true;
      "widget.dmabuf.force-enabled" = true;
    };
  };
}
