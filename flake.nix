{
  description = "flake v1";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";

    # Configure nixpkgs for both stable and unstable
    nixpkgsConfig = {
      config = {
        allowUnfree = true;
      };
    };

    pkgs = import nixpkgs {
      inherit system;
      config = nixpkgsConfig.config;
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = nixpkgsConfig.config;
    };
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          {nixpkgs = nixpkgsConfig;}
        ];
        specialArgs = {
          inherit pkgs;
          inherit pkgs-unstable;
        };
      };
    };
    homeConfigurations = {
      adityainduraj = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/home.nix
          {nixpkgs = nixpkgsConfig;}
        ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
