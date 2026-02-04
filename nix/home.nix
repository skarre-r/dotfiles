{ pkgs, lib, ... }:
{
  environment.variables = {
    NIX_MODULE = "home";
  };
  environment.systemPackages = with pkgs; [
    cloudflared
    cilium-cli
    cmctl
    fluxcd
    hubble
    just
    yt-dlp
  ];

  homebrew.casks = [
    "utm"
    "iina"
    "lulu"
    "plex"
    "calibre"
    "element"
    "keymapp"
    "affinity"
    "telegram"
    "yacreader"
    "raindropio"
    "qbittorrent"
    "transmission"
    "balenaetcher"
    "little-snitch"
    "jellyfin-media-player"
    {
      name = "freetube";
      args = {
        no_quarantine = true;
      };
    }
    {
      name = "librewolf";
      args = {
        no_quarantine = true;
      };
    }
  ];
  homebrew.masApps = {
    "QuickShade" = 931571202;
  };

  system.defaults.dock.expose-group-apps = lib.mkForce false;
  system.defaults.dock.persistent-apps = null;
  system.defaults.dock.persistent-others = null;
  system.defaults.menuExtraClock.ShowSeconds = lib.mkForce false;
}
