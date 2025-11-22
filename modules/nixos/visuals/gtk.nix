{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    whitesur-icon-theme
    whitesur-gtk-theme
    bibata-cursors
  ];

  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
  };

  programs.dconf.enable = true;
}
