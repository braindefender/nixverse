{ config, pkgs, ... }:

{
  # Bootloader.
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    helix
    btop
    broot
    zellij
    ripgrep
    firefox
    gnome-tweaks
    # discord
    # telegram-desktop
    # orca-slicer
    # blender
    # LycheeSlicer
    # vlc
    # obsidian
    # vivaldi
  ];
}
