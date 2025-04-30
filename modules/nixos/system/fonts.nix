{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ font-manager ];

  fonts = {
    packages = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-emoji
      cantarell-fonts
      font-awesome
      (nerdfonts.override {
        fonts = [
          "CascadiaCode" # Windows Terminal default font
          "FiraCode" # Best ligature-featured font
          "JetBrainsMono" # Daily-driver for development
        ];
      })
    ];

    fontconfig = {
      enable = true;
      antialias = true;

      hinting = {
        enable = true;
        autohint = true;
        style = "full"; # TODO: check
      };

      defaultFonts = {
        emoji = [
          "Segoe UI Emoji"
          "Noto Fonts Emoji"
        ];
      };

      subpixel.lcdfilter = "default"; # TODO: check
    };
  };
}
