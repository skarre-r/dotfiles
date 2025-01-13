{pkgs, ...}:
{
  homebrew = {
    casks = [
      "iina"
      "calibre"
      "freetube"
      "raindropio"
      "transmission"
      "balenaetcher"
      {
        name = "librewolf";
        args = { no_quarantine = true; };
      }
    ];
    masApps = {
      "rcmd" = 1596283165;
      "QuickShade" = 931571202;
    };
  };
}
