{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;

    package = pkgs.rofi-wayland;

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-pass
    ];

    extraConfig = {
      modi = "drun";
    };

    terminal = "kitty";
    pass = { enable = true; };
  };
}
