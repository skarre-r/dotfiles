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
          # Auto optimise?
          nix.optimise.automatic = true;
          # Cache settings
          nix.settings.substituters = [ "https://cache.nixos.org" ];
          nix.settings.trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
            "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
            "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
          nix.settings.trusted-substituters = [
            "https://cache.nixos.org"
            "https://hydra.nixos.org/"
            "https://cachix.cachix.org"
            "https://nixpkgs.cachix.org"
            "https://nix-community.cachix.org"
          ];
          nix.settings.trusted-users = [
            "skar"
          ];
          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";
          # Architecture
          nixpkgs.hostPlatform = "aarch64-darwin";
          nixpkgs.buildPlatform = "aarch64-darwin";
          # Allow "unfree" packages.
          nixpkgs.config.allowUnfree = true;
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
          hostPlatform = "aarch64-darwin";
          buildPlatform = "aarch64-darwin";
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
