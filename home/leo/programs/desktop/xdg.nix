{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "application/pdf" = [ "zen-beta.desktop" ];
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
