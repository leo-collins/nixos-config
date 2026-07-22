{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [ "gruvbox-rainbow" ];

    settings = {
      format = builtins.concatStringsSep "" [
        "[](color_orange)"
        "$os"
        "$username"
        "$hostname"
        "[](bg:color_yellow fg:color_orange)"
        "$directory"
        "[](fg:color_yellow bg:color_aqua)"
        "$git_branch"
        "$git_status"
        "[](fg:color_aqua bg:color_blue)"
        "$c"
        "$cpp"
        "$rust"
        "$golang"
        "$nodejs"
        "$bun"
        "$php"
        "$java"
        "$kotlin"
        "$haskell"
        "$python"
        "[](fg:color_blue bg:color_bg3)"
        "$docker_context"
        "$conda"
        "$pixi"
        "[](fg:color_bg3 bg:color_bg1)"
        "$time"
        "[ ](fg:color_bg1)"
        "$line_break"
        "$character"
      ];

      os.symbols.NixOS = "";

      username = {
        show_always = true;
        format = "[ $user@]($style)";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname ]($style)";
        style = "bg:color_orange fg:color_fg0";
      };
    };
  };
}
