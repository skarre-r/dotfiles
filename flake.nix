# nix-darwin options: https://mynixos.com/nix-darwin/options
# home-manager options: https://mynixos.com/home-manager/options

{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-stable.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
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
      nix-stable,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      sharedModules = [
        # nix(pkgs) settings
        {
          nixpkgs.hostPlatform = "aarch64-darwin";
          # Allow "unfree" packages.
          nixpkgs.config.allowUnfree = true;
          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";
          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;
          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;
        }
        # home-manager
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
        # base module
        ./nix/base.nix
      ];

      specialArgs = {
        inherit inputs;
        pkgs-stable = import nix-stable {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
      };
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
