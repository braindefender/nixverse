{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
    unzip
    trashy
    killall
    jq
    fd
    ripgrep
    rsync
    curl
    wget
    just
    imagemagick
    ffmpeg-full
    xclip
    feh

    du-dust
    btop
    zellij

    usbutils
    pciutils
    smartmontools
    wirelesstools
  ];
}
