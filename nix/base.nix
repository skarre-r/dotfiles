{ config, pkgs, ... }:
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
    docker
    docker-buildx
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
    k9s
    kind
    ko
    kubectl
    kube-linter
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
    rye
    sketchybar
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
  homebrew.brews = [ "helm" ];
  homebrew.casks = [
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

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

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

  system = {
    defaults = { }; # TODO
    # Set Git commit hash for darwin-version.
    configurationRevision = config.rev or config.dirtyRev or null;
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;
  };

  users.knownUsers = [ "skar" ];
  users.users."skar" = {
    uid = 501; # default uid
    home = "/Users/skar";
    shell = pkgs.zsh;
  };
}
