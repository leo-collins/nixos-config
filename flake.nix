{
  description = "Leo's NixOS systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      mkHost = { system, modules }: nixpkgs.lib.nixosSystem {
        inherit system modules;
        specialArgs = { inherit inputs; };
      };

      mkHome = { system, modules }:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          inherit modules;
          extraSpecialArgs = { inherit inputs; };
        };
    in
    {
      nixosConfigurations.heron = mkHost {
        system = "x86_64-linux";
        modules = [
          ./hosts/heron
        ];
      };
      nixosConfigurations.starling = mkHost {
        system = "x86_64-linux";
        modules = [
          ./hosts/starling
        ];
      };
      nixosConfigurations.big-pigeon = mkHost {
        system = "x86_64-linux";
        modules = [
          ./hosts/big-pigeon
        ];
      };
      nixosConfigurations.robin = mkHost {
        system = "x86_64-linux";
        modules = [
          inputs.nixos-hardware.nixosModules.microsoft-surface-go
          ./hosts/robin
        ];
      };
      homeConfigurations."lac224@IC-X149F9H0WT" = mkHome {
        system = "aarch64-darwin";
        modules = [
          ./home/leo/macbook.nix
        ];
      };
    };
}
