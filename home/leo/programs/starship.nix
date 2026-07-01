{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [ "gruvbox-rainbow" ];
    settings.os.symbols.NixOS = "";
  };
}
