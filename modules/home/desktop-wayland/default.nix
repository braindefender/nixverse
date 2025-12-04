{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Launcher
    fuzzel
    # Clipboard manager
    wl-clipboard
    # Debug
    wev
  ];
}
