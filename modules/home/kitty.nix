{ ... }:

{
  programs.kitty = {
    enable = true;

    themeFile = "ayu_mirage";

    font.name = "CaskaydiaCove Nerd Font Mono";

    settings = {
      window_padding_width = "1 5";
      enable_audio_bell = false;
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";

      "ctrl+tab" = "neighboring_window right";

      "ctrl+alt+left" = "neighboring_window left";
      "ctrl+alt+right" = "neighboring_window right";
    };
  };
}
