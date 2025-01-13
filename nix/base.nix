{config, pkgs, ...}:
{
  environment.shells = with pkgs; [ bashInteractive zsh fish nushell ];
  environment.systemPackages = with pkgs; [
    go ko uv fd
    fzf bat rye gcc lua mas k9s bun git vim zsh nil
    nixd fish stow argo llvm sops bash curl wget tmux tilt kind pnpm deno
    gopls cmake unzip pyenv
    poetry docker ctlptl podman colima zellij nodejs argocd neovim
    sshpass ripgrep chezmoi ansible gnumake lazygit kubectl
    luarocks opentofu helmfile starship coreutils fastfetch python312
    pre-commit sketchybar
    kube-linter
    jankyborders
    docker-buildx golangci-lint
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.meslo-lg
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
      "wezterm"
      "spotify"
      "obsidian"
      "1password"
      "proton-mail"
      "sublime-text"
      "proton-drive"
      "betterdisplay"
      "rectangle-pro"
      "betterdisplay"
      "eloston-chromium"
    ];
    masApps = {
      "Noir" = 1592917505;
      "Xcode" = 497799835;
      "Wipr 2" = 1662217862;
      "Numbers" = 409203825;
      "The Unarchiver" = 425424353;
      "1Password for Safari" = 1569813296;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "none";  # TODO: "uninstall" or "zap"
      upgrade = false;
    };
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

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
    configurationRevision = config.rev or config.dirtyRev or null;
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
}
