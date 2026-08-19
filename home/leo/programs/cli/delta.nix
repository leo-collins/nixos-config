{ ... }:

# https://github.com/dandavison/delta

{
  programs.delta = {
    enable = true;

    # git integration will use detla for blame, diff, log, show
    # and interactive staging
    enableGitIntegration = true;
  };
}
