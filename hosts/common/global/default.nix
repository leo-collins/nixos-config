{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./packages.nix
    ./shells.nix
    ./system.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs; };
  };

  networking.networkmanager.enable = true;
}
