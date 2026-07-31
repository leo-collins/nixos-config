{ ... }:

# Home manager profile for imperial macbook

{
  imports = [
    ./global
    ./programs/desktop/alacritty.nix
    ./programs/cli/neovim
  ];

  home = {
    username = "lac224";
    homeDirectory = "/Users/lac224";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
