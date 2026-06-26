{ ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fish_config prompt choose disco
    '';

    shellAbbrs = {
      gs = "git status";
    };

    shellAliases = {
      ll = "ls -la";
    };
  };
}
