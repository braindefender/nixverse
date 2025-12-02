{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    nautilus
  ];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-maps
    gnome-tour
  ];

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    desktopManager.gnome.enable = true;
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
