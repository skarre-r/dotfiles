{
  pkgs-unstable,
  pkgs-stable,
  lib,
  ...
}:
{
  environment.variables = {
    ZSH_AUTOCOMPLETE_PATH = pkgs-unstable.zsh-autocomplete.outPath;
  };
  environment.shells = with pkgs-unstable; [
    bashInteractive
    zsh
    fish
    nushell
  ];
  environment.systemPackages = [
    # stable
    pkgs-stable.go
    pkgs-stable.lazyjj
    # unstable
    pkgs-unstable.alejandra
    pkgs-unstable.atuin
    pkgs-unstable.argo
    pkgs-unstable.argocd
    pkgs-unstable.bash
    pkgs-unstable.bat
    pkgs-unstable.bun
    pkgs-unstable.btop
    pkgs-unstable.chezmoi
    pkgs-unstable.cmake
    pkgs-unstable.colima
    pkgs-unstable.coreutils
    pkgs-unstable.ctlptl
    pkgs-unstable.curl
    pkgs-unstable.deno
    pkgs-unstable.direnv
    pkgs-unstable.docker
    pkgs-unstable.docker-buildx
    pkgs-unstable.docker-compose
    pkgs-unstable.fd
    pkgs-unstable.fish
    pkgs-unstable.fishPlugins.fzf-fish
    pkgs-unstable.fastfetch
    pkgs-unstable.fzf
    pkgs-unstable.gcc
    pkgs-unstable.gh
    pkgs-unstable.git
    pkgs-unstable.gitui
    pkgs-unstable.golangci-lint
    pkgs-unstable.gnugrep
    pkgs-unstable.gnumake
    pkgs-unstable.gopls
    pkgs-unstable.helmfile
    pkgs-unstable.helix
    pkgs-unstable.jankyborders
    pkgs-unstable.jujutsu
    pkgs-unstable.just
    pkgs-unstable.jq
    pkgs-unstable.k9s
    pkgs-unstable.kind
    pkgs-unstable.ko
    pkgs-unstable.kubectl
    pkgs-unstable.kubernetes-helm
    pkgs-unstable.kube-linter
    pkgs-unstable.kustomize
    pkgs-unstable.lazydocker
    pkgs-unstable.lazygit
    pkgs-unstable.lua
    pkgs-unstable.lua-language-server
    pkgs-unstable.luarocks
    pkgs-unstable.llvm
    pkgs-unstable.mas
    pkgs-unstable.mcfly
    pkgs-unstable.neovim
    pkgs-unstable.nil
    pkgs-unstable.nixd
    pkgs-unstable.nixfmt-rfc-style
    pkgs-unstable.nix-index
    pkgs-unstable.nodejs
    pkgs-unstable.nushell
    pkgs-unstable.opentofu
    pkgs-unstable.pnpm
    pkgs-unstable.poetry
    pkgs-unstable.podman
    pkgs-unstable.postgresql
    pkgs-unstable.pre-commit
    pkgs-unstable.pyenv
    pkgs-unstable.python312
    pkgs-unstable.python313
    pkgs-unstable.ripgrep
    pkgs-unstable.ruff
    pkgs-unstable.rustup
    pkgs-unstable.rye
    pkgs-unstable.skhd
    pkgs-unstable.sketchybar
    pkgs-unstable.skim
    pkgs-unstable.shellcheck
    pkgs-unstable.sops
    pkgs-unstable.sshpass
    pkgs-unstable.starship
    pkgs-unstable.stow
    pkgs-unstable.sqlite
    pkgs-unstable.tilt
    pkgs-unstable.tree-sitter
    pkgs-unstable.tmux
    pkgs-unstable.unzip
    pkgs-unstable.uv
    pkgs-unstable.vim
    pkgs-unstable.wget
    pkgs-unstable.yamllint
    pkgs-unstable.yaml-language-server
    pkgs-unstable.yazi
    pkgs-unstable.zellij
    pkgs-unstable.zig
    pkgs-unstable.zsh
    pkgs-unstable.zsh-autocomplete
    pkgs-unstable.xz
  ];

  fonts.packages = with pkgs-unstable; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.meslo-lg
  ];

  homebrew = {
    enable = true;
    taps = [ "fish-shell/fish-beta-4" ];
    brews = [ "fish-shell/fish-beta-4/fish" ];
    casks = [
      "zed"
      "keka"
      "pika"
      "maccy"
      "bruno"
      "ghostty"
      "wezterm"
      "spotify"
      "neovide"
      "keymapp"
      "alt-tab"
      "obsidian"
      "hyperkey"
      "1password"
      "flashspace"
      "sf-symbols"
      "zen-browser"
      "hammerspoon"
      "proton-mail"
      "sublime-text"
      "proton-drive"
      "betterdisplay"
      "rectangle-pro"
      "eloston-chromium"
    ];
    masApps = {
      "rcmd" = 1596283165;
      "Noir" = 1592917505;
      "Xcode" = 497799835;
      "Wipr 2" = 1662217862;
      "Numbers" = 409203825;
      "Userscripts" = 1463298887;
      "The Unarchiver" = 425424353;
      "1Password for Safari" = 1569813296;
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
      package = pkgs-unstable.direnv;
    };
    fish = {
      enable = true;
      package = pkgs-unstable.fish;
      vendor = {
        completions.enable = true;
        config.enable = true;
        functions.enable = true;
      };
    };
    nix-index = {
      enable = true;
      package = pkgs-unstable.nix-index;
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
      package = lib.mkForce pkgs-unstable.vim;
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
    package = pkgs-unstable.jankyborders;
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
  services.nix-daemon.enable = true;
  services.sketchybar = {
    enable = true;
    package = pkgs-unstable.sketchybar;
  };
  services.skhd = {
    enable = false;
    package = pkgs-unstable.skhd;
  };
  services.yabai.enable = false;

  # Enable touch id sudo
  security.pam.enableSudoTouchIdAuth = false;

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
        screenEdgeGapTopNotch = 0; # 5
        screenEdgeGapTop = 0; # 25
        screenEdgeGapBottom = 30;
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
      "org.hammerspoon.Hammerspoon" = {
        HSUploadCrashData = 0;
        SUAutomaticallyUpdate = 0;
        SUEnableAutomaticChecks = 1;
        SUSendProfileInfo = 0;
        MJConfigFile = "~/.config/hammerspoon/init.lua";
      };
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
    shell = pkgs-unstable.fish;
  };
}
