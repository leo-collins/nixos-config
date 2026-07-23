{ ... }:

{
  programs.zsh = {
    enable = true;
    initContent = ''
      # Ctrl+Left/Right: move to the beginning/end of the command line.
      bindkey $'\e[1;5D' beginning-of-line
      bindkey $'\e[1;5C' end-of-line

      # Alt+Left/Right: move backward/forward by one word.
      bindkey $'\e[1;3D' backward-word
      bindkey $'\e[1;3C' forward-word

      # Some macOS terminals send Esc+b/f for Alt+Left/Right.
      bindkey $'\eb' backward-word
      bindkey $'\ef' forward-word

      # Ctrl+Backspace: delete the entire command line.
      bindkey $'\C-H' kill-whole-line

      # Alt+Backspace: delete the previous word.
      bindkey $'\e\x7f' backward-kill-word
      bindkey $'\e\C-H' backward-kill-word
    '';
    autosuggestion.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "brackets"
      ];
    };
    shellAliases = {
      lz = "lazygit";
      ll = "ls -l";
    };
    history = {
      size = 100000;
      ignoreAllDups = true;
    };
  };
}
