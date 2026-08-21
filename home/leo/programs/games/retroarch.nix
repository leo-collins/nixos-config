{ ... }:

{
  programs.retroarch = {
    enable = true;
    cores = {
      snes9x.enable = true;
      mgba.enable = true;
      pcsx2.enable = true;
      dolphin.enable = true;
    };
  };
}
