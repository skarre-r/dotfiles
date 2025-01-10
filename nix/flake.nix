# nix-darwin options: https://mynixos.com/nix-darwin/options
# home-manager options: https://mynixos.com/home-manager/options

{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    darwinConfiguration = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.vim
        pkgs.nixd
        pkgs.nil
      ];

      homebrew = {
        enable = true;
        taps = [];
        brews = [];
        casks = [
          "zed"
          "lasso"  # TODO
          "spotify"
          "obsidian"
          "1password"
          "proton-mail"
          "sublime-text"
          "proton-drive"
          "betterdisplay"
          "wezterm@nightly"
          "eloston-chromium"
        ];
        masApps = {};
        onActivation = {
          autoUpdate = false;
          cleanup = "none";  # TODO: "uninstall" or "zap"
          upgrade = false;
        };
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      programs = {
        zsh = {
          enable = true;
          enableBashCompletion = true;
          enableCompletion = true;
          enableFastSyntaxHighlighting = true;
          enableFzfCompletion = true;
          # promptInit = "eval $(starship init zsh)";
        };
        fish = {
          enable = true;
          # promptInit = "starship init fish | source";
        };
      };

      services = {
        nix-daemon.enable = true;
      };

      # Enable touch id sudo
      security.pam.enableSudoTouchIdAuth = true;

      system = {
        defaults = {};  # TODO
        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;
        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 5;
      };

      users.users.skar = {
        name = "skar";
        home = "/Users/skar";
      };
    };

    homeManagerConfiguration = { pkgs, ... }: {
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
      home.packages = with pkgs; [];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake /path/to/nix#home
    darwinConfigurations = {
      "default" = nix-darwin.lib.darwinSystem {
        modules = [
          darwinConfiguration
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.skar = homeManagerConfiguration;
          }
        ];
      };
    };
    "home" = nix-darwin.lib.darwinSystem {
      modules = [];
    };
    "work" = nix-darwin.lib.darwinSystem {
      modules = [];
    };
  };
}
