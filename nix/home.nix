{ pkgs-unstable, lib, ... }:
{
  environment.variables = {
    NIX_MODULE = "home";
  };
  environment.systemPackages = [
    pkgs-unstable.yt-dlp
    pkgs-unstable.ryubing # ryujinx
  ];

  homebrew.casks = [
    "iina"
    "lulu"
    "calibre"
    "yacreader"
    "transmission"
    "balenaetcher"
    "little-snitch"
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
