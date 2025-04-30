{ pkgs, ... }:

{
  osConfig.environment.systemPackages = with pkgs; [
    swww
    wev
    wl-clipboard
    wofi
  ];
}
