{ ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    clock24 = true;
    terminal = "tmux-256color";
    tmuxp.enable = true;  # https://github.com/tmux-python/tmuxp
#    extraConfig = ''
#      set-option -g codepoint-widths[0] U+F313=1
#    '';
  };
}
