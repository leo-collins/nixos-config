{ ... }:

# Home manager profile for imperial macbook

{
  imports = [
    ./global
    ./programs/desktop/alacritty.nix
    ./programs/cli/neovim.nix
  ];

  home = {
    username = "lac224";
    homeDirectory = "/Users/lac224";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
