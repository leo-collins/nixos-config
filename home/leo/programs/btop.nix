{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
 
    # Enable Nvidia GPU support
    package = pkgs.btop.override {
      cudaSupport = true;
    };
  };
}
