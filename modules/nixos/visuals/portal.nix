{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [ xwayland-satellite ];
  environment.variables = { DISPLAY = ":0"; };

}
