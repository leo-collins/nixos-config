{ ... }:

# Blink completion
# https://github.com/saghen/blink.cmp
# https://nix-community.github.io/nixvim/plugins/blink-cmp/index.html

{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = true;

    settings = {
      keymap.preset = "default";
      completion.documentation.auto_show = true;
      signature.enabled = true;
    };
  };
}
