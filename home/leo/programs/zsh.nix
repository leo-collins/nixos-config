{ ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      lz = "lazygit";
      ll = "ls -l";
    };
    history = {
      size = 100000;
      ignoreAllDups = true;
    };
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-history-substring-search"
        "zsh-users/zsh-completions"
      ];
    };
  };
}
