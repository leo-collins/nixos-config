{ lib, pkgs, config, ... }:

# Home manager profile for thisbe

{
  imports = [
    ./global
  ];

  # The systemd user manager runs outside nix-user-chroot and cannot resolve
  # Home Manager's nh-clean unit symlinks into /nix/store.
  programs.nh.clean.enable = lib.mkForce false;

  home = {
    username = "lac224";
    homeDirectory = "/home/ma/l/lac224";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  # being inside nix-user-chroot breaks the ssh command. Create ~/.ssh/config and tell `ssh`
  # to use it via the `-F` flag.
  programs.git.settings.core.sshCommand = "ssh -F ${config.home.homeDirectory}/.ssh/config";

  # set tmux default shell
  programs.tmux.shell = "${pkgs.zsh}/bin/zsh";
}
