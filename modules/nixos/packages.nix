{ pkgs, ... }:

{
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
