{ pkgs, lib, ... }:
{
  environment.variables = {
    NIX_MODULE = "home";
  };
  environment.systemPackages = with pkgs; [
    yt-dlp
  ];

  homebrew.casks = [
    "iina"
    "lulu"
    "calibre"
    "yacreader"
    "libreoffice"
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
    "Xcode" = 497799835;
    "QuickShade" = 931571202;
  };

  system.defaults.dock.expose-group-apps = lib.mkForce false;
  system.defaults.dock.persistent-apps = null;
  system.defaults.dock.persistent-others = null;
  system.defaults.menuExtraClock.ShowSeconds = lib.mkForce false;
}
