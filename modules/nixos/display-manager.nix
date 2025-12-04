{ pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
  };

#  programs.niri = {
#    enable = true;
#  };

  environment.systemPackages = with pkgs; [fuzzel];

#  services.xserver = {
#    enable = true;
#
#    desktopManager = {
#      xterm.enable = true;
#      xfce = {
#        enable = true;
#        noDesktop = true;
#        enableXfwm = false;
#      };
#    };
#
#    displayManager = {
#      lightdm.enable = true;
#      defaultSession = "xfce+i3";
#    };
#
#    windowManager.i3 = {
#      enable = true;
#    };
#  };
}
