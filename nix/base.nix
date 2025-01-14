{ pkgs, ... }:
{
  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
    nushell
  ];
  environment.systemPackages = with pkgs; [
    alejandra
    ansible
    argo
    argocd
    bash
    bat
    bun
    chezmoi
    cmake
    colima
    coreutils
    ctlptl
    curl
    deno
    direnv
    docker
    docker-buildx
    docker-compose
    fd
    fish
    fastfetch
    fzf
    gcc
    git
    golangci-lint
    go
    gnumake
    gopls
    helmfile
    helix
    jankyborders
    jq
    k9s
    kind
    ko
    kubectl
    kube-linter
    kustomize
    lazygit
    lua
    lua-language-server
    luarocks
    llvm
    mas
    neovim
    nil
    nixd
    nixfmt-rfc-style
    nodejs
    opentofu
    pnpm
    poetry
    podman
    pre-commit
    pyenv
    python312
    ripgrep
    ruff
    rye
    sketchybar
    shellcheck
    sops
    sshpass
    starship
    stow
    tilt
    tmux
    unzip
    uv
    vim
    wget
    yaml-language-server
    zellij
    zsh
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.meslo-lg
  ];

  homebrew.enable = true;
  homebrew.brews = [
    "helm" # the nixpkgs version doesn't support macOS
  ];
  homebrew.casks = [
    "zed"
    "ghostty"
    "wezterm"
    "spotify"
    "neovide"
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
  homebrew.masApps = {
    "Noir" = 1592917505;
    "Xcode" = 497799835;
    "Wipr 2" = 1662217862;
    "Numbers" = 409203825;
    "The Unarchiver" = 425424353;
    "1Password for Safari" = 1569813296;
  };
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.upgrade = false;

  programs.fish.enable = true;
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableFastSyntaxHighlighting = true;
    enableFzfCompletion = true;
  };

  services.nix-daemon.enable = true;
  services.sketchybar.enable = false;
  services.jankyborders = {
    enable = true;
    hidpi = true;
    width = 5.0;
    blur_radius = 0.0;
    active_color = "0xE5FFFFFF";
    inactive_color = "0x3FFFFFFF";
    blacklist = [ "pycharm" ];
  };

  # Enable touch id sudo
  security.pam.enableSudoTouchIdAuth = true;

  # macOS settings
  system.defaults = {
    ActivityMonitor = {
      IconType = 1;
      OpenMainWindow = true;
      ShowCategory = 100;
    };
    controlcenter = {
      BatteryShowPercentage = true;
      Sound = true;
    };
    dock = {
      appswitcher-all-displays = false;
      autohide = true;
      autohide-delay = null;
      expose-animation-duration = 0.1;
      expose-group-apps = true;
      launchanim = false;
      magnification = false;
      mineffect = "scale";
      minimize-to-application = true;
      mouse-over-hilite-stack = true;
      persistent-apps = null; # TODO
      persistent-others = null;
      show-process-indicators = true;
      show-recents = false;
      showhidden = true;
      slow-motion-allowed = false;
      static-only = false;
      tilesize = 48;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
    };
    finder = {
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
      _FXSortFoldersFirstOnDesktop = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "Nlsv";
      FXRemoveOldTrashItems = false;
      NewWindowTarget = "Other";
      NewWindowTargetPath = "file:///Users/skar/Downloads";
      QuitMenuItem = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowPathbar = true;
      ShowRemovableMediaOnDesktop = false;
      ShowStatusBar = true;
    };
    menuExtraClock = {
      FlashDateSeparators = false;
      IsAnalog = false;
      Show24Hour = true;
      ShowAMPM = false;
      ShowDate = 0;
      ShowDayOfMonth = true;
      ShowDayOfWeek = true;
      ShowSeconds = true;
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = false;
      "com.apple.mouse.tapBehavior" = 1;
      "com.apple.sound.beep.feedback" = 1;
      "com.apple.springing.enabled" = true;
      "com.apple.swipescrolldirection" = true;
      "com.apple.trackpad.enableSecondaryClick" = true;
      _HIHideMenuBar = false; # autohide menu bar
      AppleFontSmoothing = null;
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleInterfaceStyleSwitchesAutomatically = false;
      AppleScrollerPagingBehavior = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      AppleShowScrollBars = "Automatic";
      AppleSpacesSwitchOnActivate = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticWindowAnimationsEnabled = false;
      NSScrollAnimationEnabled = true;
      NSTableViewDefaultSizeMode = 2;
    };
    screencapture = {
      disable-shadow = false;
      include-date = true;
      location = "/Users/skar/Pictures";
    };
    spaces.spans-displays = false;
    trackpad = {
      ActuationStrength = 1;
      Clicking = true;
      Dragging = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = false;
      TrackpadThreeFingerTapGesture = 0;
    };
    universalaccess.reduceMotion = false;
  };

  users.knownUsers = [ "skar" ];
  users.users."skar" = {
    uid = 501; # default uid
    home = "/Users/skar";
    shell = pkgs.zsh;
  };
}
