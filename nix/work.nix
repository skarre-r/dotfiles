{pkgs, ...}:
{
  environment.packages = with pkgs; [
    odo
    glab
    vault
    unixodbc
    openshift
    azure-cli
  ];

  homebrew = {
    taps = [
      "microsoft/mssql-release"
    ];
    brews = [
      "microsoft/mssql-release/msodbcsql18"
      "microsoft/mssql-release/mssql-tools18"
    ];
    casks = [
      "slack"
      "bruno"
      "goland"
      "raycast"
      "pycharm"
      "displaylink"
      "microsoft-teams"
      "firefox-developer-edition"
    ];
  };
}
