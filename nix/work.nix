{ pkgs, lib, ... }:
{
  environment.variables = {
    NIX_MODULE = "work";
  };
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
  homebrew.masApps = {
    "Windows App" = 1295203466;
  };
  homebrew.onActivation.cleanup = "none";

  services.jankyborders.hidpi = lib.mkForce false;

  system.defaults.dock.persistent-apps = null;
  system.defaults.dock.persistent-others = null;
}
