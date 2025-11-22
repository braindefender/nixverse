{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
    wev
    wl-clipboard
    wofi
  ];
}
