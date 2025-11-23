{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # - 3D Printing
    blender
    openscad
    # orca-slicer

    # - Browsers
    chromium
    vivaldi
    firefox

    # - File Management
    gparted
    # krusader
    qbittorrent

    # - Multimedia
    vlc
    gimp
    # obs-studio

    # - Network
    throne

    # - Social
    # discord
    telegram-desktop
  ];
}
