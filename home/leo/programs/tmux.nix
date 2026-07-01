{ ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    terminal = "tmux-256color";
#    extraConfig = ''
#      set-option -g codepoint-widths[0] U+F313=1
#    '';
  };
}
