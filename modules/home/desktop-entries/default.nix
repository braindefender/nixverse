{ pkgs, ... }:

let
  app = pkgs.writeShellScript "vivaldi-teams" ''  
    vivaldi --app=https://teams.microsoft.com/v2/
  '';
  nirius = ''nirius focus-or-spawn --app-id="^vivaldi-teams"'';
in

{
  xdg.desktopEntries = {
    teams = {
      name = "Teams";
      genericName = "Video Conferencing, Meetings, Calling";
      exec = "${nirius} ${app}";
      terminal = false;
      categories = ["Network" "InstantMessaging"];
      icon = ./Microsoft_Teams.svg;
    };
  };
}
