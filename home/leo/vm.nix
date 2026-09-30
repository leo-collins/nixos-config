{ ... }:

# Home manager profile for arbitrary VMs
# - Install nix
# - add `experimental-features = nix-command flakes` to `/etc/nix/nix.conf` (or ~/.config/nix/nix.conf)
# - add a host to flake.nix
# - bootstrap with `nix run github:nix-community/home-manager/master -- switch --flake .#leo@machine`
# - add the nix zsh to /etc/shells: `echo "/home/leo/.nix-profile/bin/zsh" | sudo tee -a /etc/shells`
# - change users shell `chsh -s /home/leo/.nix-profile/bin/zsh`
# - afterwards do `nh home switch`

{
  imports = [
    ./global
  ];

  home = {
    username = "leo";
    homeDirectory = "/home/leo";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
