{ ... }:

{
  programs.zsh = {
    enable = true;
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
