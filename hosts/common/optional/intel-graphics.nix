{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver  # VA-API for broadwell (gen5) and newer
      # GCC 16 build fix: https://github.com/NixOS/nixpkgs/pull/568713
      (intel-compute-runtime-legacy1.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          (fetchpatch {
            url = "https://github.com/intel/compute-runtime/commit/c1eb6c1a183c2f69e0d6e9ed5aa042fac2201217.patch";
            hash = "sha256-O8ZJaxIr4TF73T+fyEbNjEYFbgwLxIUWoYnorxh8ZTo=";
          })
        ];
      })) # supports gen8, gen9, gen11
    ];
  };
}
