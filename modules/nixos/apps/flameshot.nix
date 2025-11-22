{ ... }:

let
  savePath = "/nexus/images/screens";
in

{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        inherit savePath;
        showHelp = false;
        showSidePanelButton = true;
        showStartupLaunchMessage = false;
        uiColor = "#ffffff";
        contrastOpacity = 188;
        contrastUiColor = "#000000";
        drawColor = "#ff00ff";
        drawThickness = 5;
      };
    };
  };

}
