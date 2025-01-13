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

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
  let
    darwinConfiguration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;

      environment.shells = with pkgs; [ bashInteractive zsh fish nushell ];
      environment.systemPackages = with pkgs; [
        go
        ko
        uv
        fd
        fzf
        bat
        rye
        gcc
        lua
        mas
        k9s
        bun
        git
        vim
        zsh
        nil
        nixd
        fish
        stow
        argo
        llvm
        sops
        bash
        curl
        wget
        tmux
        tilt
        kind
        #helm
        pnpm
        deno
        gopls
        cmake
        unzip
        pyenv
        #vault
        poetry
        docker
        ctlptl
        podman
        colima
        zellij
        nodejs
        argocd
        neovim
        sshpass
        ripgrep
        chezmoi
        ansible
        gnumake
        lazygit
        kubectl
        luarocks
        opentofu
        helmfile
        starship
        coreutils
        fastfetch
        pre-commit
        python312
        sketchybar
        kube-linter
        jankyborders
        docker-buildx
        golangci-lint
      ];

      homebrew = {
        enable = true;
        taps = [];
        brews = [
          "helm" # nixpkgs version doesn't work on mac
        ];
        casks = [
          "zed"
          "ghostty"
          "spotify"
          "obsidian"
          "1password"
          "proton-mail"
          "sublime-text"
          "proton-drive"
          "rectangle-pro"
          "betterdisplay"
          "wezterm@nightly"
          "eloston-chromium"
        ];
        masApps = {
          "Noir" = 1592917505;
          "Wipr 2" = 1662217862;
          "The Unarchiver" = 425424353;
          "1Password for Safari" = 1569813296;
          # TODO: numbers, xcode, etc.
          # "rcmd" = 1596283165;
          # "QuickShade" = 931571202;
        };
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
        };
        fish = {
          enable = true;
        };
      };

      services = {
        nix-daemon.enable = true;
        jankyborders = {
          enable = true;
          hidpi = true;
          width = 5.0;
          blur_radius = 0.0;
          active_color = "0xE5FFFFFF";
          inactive_color = "0x3FFFFFFF";
          blacklist = [ "pycharm" ];
        };
        sketchybar = {
          enable = false;
        };
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

      users.knownUsers = [ "skar" ];
      users.users."skar" = {
        uid = 501;  # default uid
        home = "/Users/skar";
        shell = pkgs.zsh;
      };
    };

    homeManagerConfiguration = { pkgs, ... }: {
      home.stateVersion = "25.05";
      programs = {
        home-manager.enable = true;
        # TODO conflicts with dotfiles
        fish.enable = false;
        zsh.enable = false;
        nushell.enable = false;
      };
      home.packages = with pkgs; [];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake /path/to/dotfiles/repo#default
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
