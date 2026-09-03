{ ... }:

{
  imports = [
    ./global
    ./programs/desktop/alacritty.nix
    ./programs/desktop/zen-browser.nix
    ./programs/desktop/feishin.nix
    ./programs/desktop/niri.nix
    ./programs/desktop/noctalia.nix
    ./programs/desktop/nautilus.nix

    # ./programs/desktop/slack.nix
    ./programs/desktop/obsidian.nix
  ];
}
