{ pkgs, ... }:
{
  environment.variables = { };
  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
    nushell
  ];
  environment.systemPackages = with pkgs; [
    aerospace
    alejandra
    argo
    argocd
    bash
    bat
    bun
    btop
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
    gh
    git
    golangci-lint
    go
    gnugrep
    gnumake
    gopls
    helmfile
    helix
    jankyborders
    just
    jq
    k9s
    kind
    ko
    kubectl
    kubernetes-helm
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
    nushell
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
  homebrew.taps = [ "fish-shell/fish-beta-4" ];
  homebrew.brews = [ "fish-shell/fish-beta-4/fish" ];
  homebrew.casks = [
    "zed"
    "pika"
    "maccy"
    "ghostty"
    "wezterm"
    "spotify"
    "neovide"
    "alt-tab"
    "obsidian"
    "1password"
    "sf-symbols"
    "hammerspoon"
    "proton-mail"
    "sublime-text"
    "proton-drive"
    "betterdisplay"
    "rectangle-pro"
    "eloston-chromium"
  ];
  homebrew.masApps = {
    "rcmd" = 1596283165;
    "Noir" = 1592917505;
    "Xcode" = 497799835;
    "Wipr 2" = 1662217862;
    "Numbers" = 409203825;
    "Userscripts" = 1463298887;
    "The Unarchiver" = 425424353;
    "1Password for Safari" = 1569813296;
  };
  homebrew.onActivation.autoUpdate = false;
  homebrew.onActivation.upgrade = false;

  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };
  programs.zsh = {
    enable = true;
    enableBashCompletion = true;
    enableCompletion = true;
    enableFastSyntaxHighlighting = true;
    enableFzfCompletion = true;
  };

  services.nix-daemon.enable = true;
  services.aerospace = {
    enable = false;
    package = pkgs.aerospace;
  };
  services.cachix-agent.enable = false; # TODO
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    hidpi = true;
    width = 5.0;
    blur_radius = 0.0;
    active_color = "0xE5FFFFFF";
    inactive_color = "0x3FFFFFFF";
    blacklist = [
      "pycharm"
      "goland"
    ];
  };
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
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
      appswitcher-all-displays = true;
      autohide = true;
      autohide-delay = null;
      expose-animation-duration = 0.1;
      expose-group-apps = true;
      launchanim = false;
      magnification = false;
      mineffect = "scale";
      minimize-to-application = true;
      mouse-over-hilite-stack = true;
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
      _HIHideMenuBar = true;
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
      Dragging = false;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = false;
      TrackpadThreeFingerTapGesture = 0;
    };
    CustomSystemPreferences = { };
    CustomUserPreferences = {
      "com.apple.Safari" = {
        AutoFillCreditCardData = 0;
        AutoFillFromAddressBook = 0;
        AutoFillMiscellaneousForms = 0;
        AutoFillPasswords = 0;
        HomePage = "";
        IncludeDevelopMenu = 1;
      };
      "com.knollsoft.Hookshot" = {
        SUEnableAutomaticChecks = 1;
        allowAnyShortcut = 1;
        doubleClickTitleBar = 0;
        gapSize = 8;
        hideMenubarIcon = 0;
        iCloudSync = 1;
        launchOnLogin = 1;
        moveCursorAcrossDisplays = 1;
        screenEdgeGapTopNotch = 5;
        screenEdgeGapTop = 25;
        subsequentExecutionMode = 3;
        unsnapRestore = 2;
      };
      "com.lowtechguys.rcmd" = {
        activateAllWindows = 1;
        allowWindowSwitcher = 0;
        appSwitcherFeatures = 6;
        enableAssignHotkey = 0;
        enableCycleHotkey = 0;
        hammerspoonInstalled = 1;
        hideMenubarIcon = 0;
        hideStaticSettings = 0;
        popoverClosed = 1;
        showAppSwitcher = 1;
        switcherScreenPlacement = 7;
        tutorialHidden = 1;
        windowSwitchOSDDelay = 700;
        windowSwitcherAppearance = ''\\"comfortable\\"''; # TODO?
      };
      "com.lwouis.alt-tab-macos" = {
        appearanceSize = 1;
        appearanceStyle = 2;
        appearanceTheme = 1;
        appearanceVisibility = 1;
        crashPolicy = 0;
        hideAppBadges = false;
        hideSpaceNumberLabels = false;
        hideStatusIcons = false;
        hideWindowlessApps = true;
        holdShortcut = "\\U2318";
        menubarIcon = 0;
        mouseHoverEnabled = true;
        previewFocusedWindow = true;
        shortcutStyle = 0;
        showFullscreenWindows = 1;
        showHiddenWindows = 0;
        showMinimizedWindows = 1;
        showTabsAsWindows = false;
        showTitles = 2;
        startAtLogin = true;
        updatePolicy = 1;
        windowDisplayDelay = 0;
        windowMaxWidthInRow = 30;
      };
      "org.hammerspoon.Hammerspoon" = {
        HSUploadCrashData = 0;
        SUAutomaticallyUpdate = 0;
        SUEnableAutomaticChecks = 1;
        SUSendProfileInfo = 0;
      };
      "org.p0deje.Maccy" = {
        showApplicationIcons = 1;
        showFooter = 1;
        showSearch = 1;
        showTitle = 1;
      };
      "pro.betterdisplay.BetterDisplay" = { };
    };
  };

  users.knownUsers = [ "skar" ];
  users.users."skar" = {
    uid = 501; # default uid
    home = "/Users/skar";
    shell = pkgs.fish;
  };

  # home-manager
  home-manager.backupFileExtension = "backup";
  home-manager.users.skar.programs = {
    bash = {
      enable = false;
      package = pkgs.bashInteractive;
      enableCompletion = true;
    };
    fish = {
      enable = false;
      package = pkgs.fish;
      generateCompletions = true;
      preferAbbrs = true;
      shellInit = ""; # TODO
    };
    zsh = {
      enable = false;
      package = pkgs.zsh;
      autocd = true;
      dotDir = ".config/zsh";
      enableCompletion = true;
      autosuggestion.enable = true;
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ""; # TODO
    };
  };
}
