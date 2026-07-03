{ ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fish_config prompt choose nim
    '';

    shellAbbrs = {
      gs = "git status";
    };

    shellAliases = {
      ll = "ls -la";
    };
  };

  programs.bash = {
    enable = true;

    initExtra = ''
      if [[ $- == *i* ]] && command -v fish >/dev/null; then
        exec fish
      fi
    '';
  };
}
