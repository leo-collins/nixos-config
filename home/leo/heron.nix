{ pkgs, ... }:

{
  imports = [
    ./global
    ./packages.nix
    ./programs/firefox.nix
    ./programs/codex.nix
    ./programs/git.nix
    ./programs/zen-browser.nix
    ./programs/lazygit.nix
    ./programs/zsh.nix
    ./programs/starship.nix
    ./programs/fzf.nix
    ./programs/alacritty.nix
    ./programs/eza.nix
    ./programs/tmux.nix
    ./programs/btop.nix
    ./programs/gnome.nix
    ./programs/mangohud.nix
  ];

  # symlink cursor icons into home directory.
  # This fixes an issue where some apps cannot find the cursor
  # and default to a different (non-scaled) cursor, e.g. in steam
  # see: https://github.com/NixOS/nixpkgs/issues/437281
  # https://github.com/ValveSoftware/steam-for-linux/issues/11484
  # https://forums.factorio.com/113202
  # NOTE: This does it for the KDE breeze theme; figure out a way to
  # do this in general, e.g. for GNOME too
  home.file.".local/share/icons/breeze_cursors" = {
    source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors/";
    recursive = true;
  };
}
