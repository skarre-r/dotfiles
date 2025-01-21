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
    "keka"
    "calibre"
    "openemu"
    "freetube"
    "raindropio"
    "yacreader"
    "transmission"
    "balenaetcher"
    "little-snitch"
    "monitorcontrol"
    "keyboard-cowboy"
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
  homebrew.onActivation.autoUpdate = lib.mkForce true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.onActivation.extraFlags = [ "--verbose" ];
  homebrew.onActivation.upgrade = lib.mkForce true;

  system.defaults.dock.expose-group-apps = lib.mkForce false;
  system.defaults.dock.persistent-apps = null;
  system.defaults.dock.persistent-others = null;
  system.defaults.menuExtraClock.ShowSeconds = lib.mkForce false;
}
