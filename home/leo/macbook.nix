{ ... }:

# Home manager profile for imperial macbook

{
  imports = [
    ./global
    ./programs/desktop/alacritty.nix
    ./programs/desktop/iina.nix
    ./programs/desktop/feishin.nix
    ./programs/games/prismlauncher.nix

    # vimtex brings in texlive which is pretty substantial,
    # so we do not add it to neovim/default.nix
    ./programs/cli/neovim/vimtex.nix
  ];

  home = {
    username = "lac224";
    homeDirectory = "/Users/lac224";

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };
}
