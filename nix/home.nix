{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    yt-dlp
  ];

  homebrew.casks = [
    "iina"
    "calibre"
    "freetube"
    "raindropio"
    "yacreader"
    "transmission"
    "balenaetcher"
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
  homebrew.onActivation.cleanup = "zap"; # or "uninstall"

  system.defaults.dock.persistent-apps = null;
  system.defaults.dock.persistent-others = null;
  system.defaults.menuExtraClock.ShowSeconds = lib.mkForce false;

  users.users."skar".shell = lib.mkForce pkgs.fish;
}
