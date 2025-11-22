{ config, ... }:

let
  struts = 16;
  gaps = 16;
in

{

  imports = [ ../desktop-wayland ];

  programs.niri = {
    enable = true;

    settings = {
      outputs = {
        "HDMI-A-1" = {
          mode = {
            width = 3440;
            height = 1440;
            refresh = 99.982;
          };
        };
      };

      xwayland-satellite.enable = true;
      gestures.hot-corners.enable = true;
      prefer-no-csd = true;

      input = {
        workspace-auto-back-and-forth = true;

        keyboard = {
          numlock = true;
          xkb = {
            file = builtins.readFile ../../nixos/universal-layout/ul-ortho-combo.xkb;
            # layout = "ul-ortho-combo";
          };
        };
      };

      layout = {
        gaps = gaps;

        struts = {
          top = struts;
          left = struts;
          right = struts;
          bottom = struts;
        };

        center-focused-column = "on-overflow";

        focus-ring = {
          enable = false;
          # width = 4;
          # active = "#7fc8ff";
          # inactive = "#505050";
        };

        border = {
          enable = true;
          width = 4;
          active = { color = "#7fc8ff"; };
          inactive = { color = "#505050"; };
        };
      };

      binds = with config.lib.niri.actions; {
        # Exit Niri
        "Mod+Shift+E".action = quit;

        # Exit Window
        "Mod+Q".action = close-window;

        # Run Walker - App Launcher
        "Mod+Space".action = spawn "walker";

        "ISO_Next_Group".action = switch-layout "next";

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Plus".action = set-column-width "+10%";

        "Mod+1".action = focus-workspace 1;
      };
    };
  };
}
