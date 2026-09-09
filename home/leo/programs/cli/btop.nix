{ pkgs, lib, ... }:

{
  programs.btop = {
    enable = true;
 
    # Enable Nvidia GPU support, only on Linux
    # TODO: this should be enabled only for Nvidia GPU hosts
    package = pkgs.btop.override (
      lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
        cudaSupport = true;
      }
    );

    settings = {
      shown_boxes = "cpu mem net proc";
      shown_gpus = "nvidia amd intel apple";
      show_gpu_info = "On";
      update_ms = 500;
    };
  };
}
