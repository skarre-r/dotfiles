{ pkgs, ... }:
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
  homebrew.onActivation.cleanup = "uninstall"; # or "zap"
}
