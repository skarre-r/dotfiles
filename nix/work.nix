{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    odo
    glab
    vault
    unixODBC
    openshift
    azure-cli
  ];

  homebrew.taps = [ "microsoft/mssql-release" ];
  homebrew.brews = [
    "microsoft/mssql-release/msodbcsql18"
    "microsoft/mssql-release/mssql-tools18"
  ];
  homebrew.casks = [
    "slack"
    "bruno"
    "goland"
    "alt-tab"
    "raycast"
    "pycharm"
    "displaylink"
    "microsoft-teams"
    "firefox-developer-edition"
  ];
  homebrew.onActivation.cleanup = "none";
}
