{
  pkgs,
  lib,
  ...
}:
{
  environment.variables = {
    ZSH_AUTOCOMPLETE_PATH = pkgs.zsh-autocomplete.outPath;
  };
  environment.shells = with pkgs; [
    bashInteractive
    zsh
    fish
    nushell
  ];
  environment.systemPackages = with pkgs; [
    alejandra
    atuin
    # argo-workflows
    argocd
    bash
    bat
    bun
    btop
    broot
    chezmoi
    cmake
    colima
    coreutils
    ctlptl
    curl
    deno
    direnv
    diskus
    docker
    docker-buildx
    docker-compose
    eza
    fd
    fish
    fastfetch
    fzf
    gcc
    gh
    git
    # gitui
    golangci-lint
    gnugrep
    gettext
    gnumake
    go
    gopls
    helmfile
    helix
    hexyl
    htmx-lsp
    htmx-lsp2
    hyperfine
    jankyborders
    jujutsu
    jjui
    just
    jq
    k9s
    kind
    ko
    kubectl
    kubernetes-helm
    kube-linter
    kustomize
    lazydocker
    lazygit
    lazyjj
    lua
    lua-language-server
    luarocks
    llvm
    mas
    mc
    mcfly
    mise
    neovim
    nil
    nixd
    nixfmt-rfc-style
    nix-index
    nodejs
    nushell
    openssh
    # openssh_gssapi
    # openssh_hpnWithKerberos
    opentofu
    pandoc
    pastel
    pls
    pnpm
    poetry
    podman
    postgresql
    pre-commit
    pyenv
    python312
    python313
    ripgrep
    ruff
    rustup
    rye
    skhd
    sketchybar
    skim
    shellcheck
    sops
    sshpass
    starship
    stow
    sqlite
    taplo
    tilt
    tree-sitter
    tmux
    unzip
    uv
    vim
    wget
    yamllint
    yaml-language-server
    yazi
    zellij
    zig
    zoxide
    zsh
    zsh-autocomplete
    xz
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.meslo-lg
  ];

  homebrew = {
    enable = true;
    taps = [ ];
    brews = [
      "mas"
      "fileicon"
    ];
    casks = [
      "zed"
      "keka"
      "pika"
      "slack"
      "maccy"
      "bruno"
      "orion"
      "tidal"
      "typora"
      "goland"
      "thorium"
      "pycharm"
      "ghostty"
      "wezterm"
      "spotify"
      "alt-tab"
      "markedit"
      "obsidian"
      "hyperkey"
      "vscodium"
      "1password"
      "flashspace"
      "sf-symbols"
      "hammerspoon"
      "libreoffice"
      "proton-mail"
      "sublime-text"
      "proton-drive"
      "betterdisplay"
      "rectangle-pro"
    ];
    masApps = {
      "rcmd" = 1596283165;
      "Noir" = 1592917505;
      "Wipr 2" = 1662217862;
      "Userscripts" = 1463298887;
      "1Password for Safari" = 1569813296;
      "Obsidian Web Clipper" = 6720708363;
    };
    global = {
      autoUpdate = true;
      brewfile = true;
      lockfiles = false;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      extraFlags = [ ];
      upgrade = true;
    };
  };

  programs = {
    bash = {
      enable = true;
      completion.enable = false;
    };
    direnv = {
      enable = true;
      package = pkgs.direnv;
    };
    fish = {
      enable = true;
      package = pkgs.fish;
      vendor = {
        completions.enable = true;
        config.enable = true;
        functions.enable = true;
      };
    };
    nix-index = {
      enable = true;
      package = pkgs.nix-index;
    };
    tmux = {
      enable = true;
      enableFzf = false;
      enableMouse = true;
      enableSensible = false;
      enableVim = false;
    };
    vim = {
      enable = true;
      package = lib.mkForce pkgs.vim;
      enableSensible = false;
    };
    zsh = {
      enable = true;
      enableBashCompletion = false;
      enableCompletion = false;
      enableFastSyntaxHighlighting = true;
      enableFzfCompletion = false;
      enableFzfGit = false;
      enableFzfHistory = false;
      enableGlobalCompInit = false;
      enableSyntaxHighlighting = false;
    };
  };

  services.aerospace.enable = false;
  services.cachix-agent.enable = false;
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    # config:
    style = "round";
    order = "below";
    active_color = "0xE5FFFFFF";
    inactive_color = "0x3FFFFFFF";
    background_color = "0x00FFFFFF";
    width = 4.5;
    # blur_radius = 1.0;
    ax_focus = false;
    hidpi = true;
    blacklist = [ "pycharm,goland" ];
  };
  services.sketchybar = {
    enable = false;
    package = pkgs.sketchybar;
  };
  services.skhd = {
    enable = false;
    package = pkgs.skhd;
  };
  services.yabai.enable = false;

  # Enable touch id sudo
  security.pam.services.sudo_local.touchIdAuth = false;

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
      _HIHideMenuBar = false;
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
    CustomSystemPreferences = {
      # "Apple Global Domain" = {
      #   NSUserKeyEquivalents = {
      #     Minimise = "@~^$\\Uf715";
      #     "Minimise All" = "@~^$\\Uf713";
      #     Minimize = "@~^$\\Uf716";
      #     "Minimize All" = "@~^$\\Uf714";
      #   };
      # };
    };
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
        screenEdgeGapTopNotch = 0; # 5
        screenEdgeGapTop = 0; # 25
        # screenEdgeGapBottom = 30;
        screenEdgeGapBottom = 0;
        subsequentExecutionMode = 3;
        unsnapRestore = 2;
      };
      "com.lowtechguys.rcmd" = {
        activateAllWindows = 1;
        allowWindowSwitcher = 0;
        appSwitcherFeatures = 6;
        enableAssignHotkey = 0;
        enableCycleHotkey = 0;
        # hammerspoonInstalled = 1;
        hideMenubarIcon = 0;
        hideStaticSettings = 0;
        popoverClosed = 1;
        showAppSwitcher = 1;
        switcherScreenPlacement = 7;
        tutorialHidden = 1;
        windowSwitchOSDDelay = 700;
        windowSwitcherAppearance = ''\\"comfortable\\"''; # TODO?
      };
      # TODO: fix
      "com.lwouis.alt-tab-macos" = {
        appearanceSize = 1;
        appearanceStyle = 2;
        appearanceTheme = 1;
        appearanceVisibility = 1;
        crashPolicy = 0;
        fadeOutAnimation = true;
        hideSpaceNumberLabels = true;
        holdShortcut = "\\U2318";
        menubarIcon = 0;
        previewFocusedWindow = true; # TODO
        shortcutStyle = 0;
        showFullscreenWindows = 1;
        showHiddenWindows = 0;
        showMinimizedWindows = 1;
        showTitles = 2;
        updatePolicy = 2;
        windowDisplayDelay = 0;
        windowMaxWidthInRow = 30;
      };
      # "org.hammerspoon.Hammerspoon" = {
      #   HSUploadCrashData = 0;
      #   SUAutomaticallyUpdate = 0;
      #   SUEnableAutomaticChecks = 1;
      #   SUSendProfileInfo = 0;
      #   MJConfigFile = "~/.config/hammerspoon/init.lua";
      # };
      "org.p0deje.Maccy" = {
        showApplicationIcons = 1;
        showFooter = 1;
        showSearch = 1;
        showTitle = 1;
      };
      "pro.betterdisplay.BetterDisplay" = { };
      "com.knollsoft.Hyperkey" = {
        SUEnableAutomaticChecks = 0;
        capsLockRemapped = 2;
        keyRemap = 1;
        launchOnLogin = 1;
      };
    };
  };

  users.knownUsers = [ "skar" ];
  users.users."skar" = {
    uid = 501; # default uid
    home = "/Users/skar";
    shell = pkgs.fish;
  };
}
