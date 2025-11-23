{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # - Common
    btop
    fd
    jq
    killall
    ripgrep

    # - File Management
    broot
    dust
    rsync
    trashy
    unzip
    zellij

    # - Editors
    vim
    neovim
    obsidian
    zed-editor

    # - Multimedia
    imagemagick
    ffmpeg-full
    xclip
    feh

    # - Network
    curl
    wget

    # - HW Utilities
    usbutils
    pciutils
    smartmontools
    wirelesstools
  ];
}
