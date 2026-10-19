{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver  # VA-API for broadwell (gen5) and newer
      intel-compute-runtime-legacy1  # supports gen8, gen9, gen11
    ];
  };
}
