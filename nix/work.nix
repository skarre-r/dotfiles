{ pkgs, lib, ... }:
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
    "raycast"
    "pycharm"
    "displaylink"
    "microsoft-teams"
    "firefox@developer-edition"
  ];
  homebrew.onActivation.cleanup = "none";

  system.defaults.dock.appswitcher-all-displays = lib.mkForce true;
  system.defaults.dock.persistent-apps = null;
  system.defaults.dock.persistent-others = null;
  system.defaults.paces.spans-displays = lib.mkForce true;
}
