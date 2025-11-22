{ pkgs, ... }:

{
  fonts.packages = with pkgs; [ source-sans-pro ];

  environment.systemPackages = with pkgs; [
    kdePackages.qtwayland
    kdePackages.qqc2-desktop-style
    libsForQt5.breeze-icons
    libsForQt5.breeze-qt5
  ];

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
