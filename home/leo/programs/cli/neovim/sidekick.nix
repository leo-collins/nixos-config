{ ... }:

{
  programs.nixvim = {
    plugins = {
      sidekick = {
        enable = true;
      };
    };
    
    nixpkgs.config.allowUnfreePackages = [
      "copilot-language-server"
    ];

    lsp.servers = {
      copilot.enable = true;
    };
  };
}
