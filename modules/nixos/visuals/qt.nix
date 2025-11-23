{ pkgs, ... }:

{
  fonts.packages = with pkgs; [ source-sans-pro ];

  environment.systemPackages = with pkgs; [
    kdePackages.qtwayland
    kdePackages.qqc2-desktop-style
  ];

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
