{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        email = "collins.leo@proton.me";
        name = "Leo Collins";
      };

      init.defaultBranch = "main";
      core.editor = "vim";
      merge.conflictStyle = "zdiff3";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
}
