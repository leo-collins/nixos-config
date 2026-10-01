{ inputs, pkgs, ... }:

{
  home.packages = [
    # Fix for Zotero from https://github.com/NixOS/nixpkgs/pull/569006. Issue: https://github.com/NixOS/nixpkgs/issues/568692
    (pkgs.callPackage
      (inputs.zotero-fix-src + "/pkgs/by-name/zo/zotero/package.nix")
      { })
  ];
}
