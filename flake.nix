# nix-darwin options: https://mynixos.com/nix-darwin/options
# home-manager options: https://mynixos.com/home-manager/options

{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      nixpkgsModule = {
        nixpkgs.hostPlatform = "aarch64-darwin";
        nixpkgs.config.allowUnfree = true;
      };

      sharedModules = [
        nixpkgsModule
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            verbose = true;
            users.skar = {
              home.stateVersion = "25.05";
              programs.home-manager.enable = true;
              home.packages = [ ];
            };
          };
        }
        ./nix/base.nix
      ];
      specialArgs = { inherit inputs; };
    in
    {
      darwinConfigurations = {
        "home" = nix-darwin.lib.darwinSystem {
          modules = sharedModules ++ [ ./nix/home.nix ];
          specialArgs = specialArgs;
        };
        "work" = nix-darwin.lib.darwinSystem {
          modules = sharedModules ++ [ ./nix/work.nix ];
          specialArgs = specialArgs;
        };
      };
    };
}
