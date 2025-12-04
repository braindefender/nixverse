{ config, pkgs, ... }:

let
  struts = 16;
  gaps = 16;
in

{

  imports = [ ../desktop-wayland ];

  programs.niri = {
    enable = true;

    package = pkgs.niri;

    settings = {
      screenshot-path = "~/Screens/%Y-%m-%d_%H-%M-%S.png";

      outputs = {
        "HDMI-A-1" = {
          mode = {
            width = 3440;
            height = 1440;
            refresh = 99.982;
          };

          scale = 1;

          position = {
            x = 0;
            y = 0;
          };
        };
      };

      xwayland-satellite.enable = true;
      gestures.hot-corners.enable = true;
      prefer-no-csd = true;

      spawn-at-startup = [
        {
          command = [ "noctalia-shell" ];
        }
        {
          command = [ "nm-applet" ];
        }
      ];

      input = {
        warp-mouse-to-focus.enable = true;

        keyboard = {
          numlock = false;
          xkb = {
            file = "${../../nixos/universal-layout/ul-ortho-combo.xkb}";
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

        default-column-width = {
          proportion = 0.5;
        };

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        focus-ring = {
          enable = true;
          width = 2;
          active = {
            color = "#7fc8ff";
          };
          inactive = {
            color = "#505050";
          };
        };

        border = {
          enable = false;
          width = 4;
          active = {
            color = "#7fc8ff";
          };
          inactive = {
            color = "#505050";
          };
        };

        shadow = {
          enable = false;
          color = "#0007";
          softness = 30;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
        };
      };

      window-rules = [
        {
          clip-to-geometry = true;
          geometry-corner-radius = {
            top-left = 8.0;
            top-right = 8.0;
            bottom-left = 8.0;
            bottom-right = 8.0;
          };
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture";
            }
            {
              app-id = "nm-connection-editor";
            }
          ];
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = ''^org\.telegram\.desktop$'';
              title = "^Media viewer$";
            }
          ];
          # Waiting for PR: https://github.com/sodiboo/niri-flake/pull/1382
          # open-maximized-to-edges = true;
          open-fullscreen = true;
          open-floating = true;
        }
      ];

      binds = with config.lib.niri.actions; {
        # Show hotkey overlay
        "Mod+Shift+Slash".action = show-hotkey-overlay;

        # Exit niri
        "Mod+Shift+E".action = quit;
        "Ctrl+Alt+Delete".action = quit;

        # Exit window
        "Mod+Q" = {
          repeat = false;
          action = close-window;
        };

        # Workspaces
        "Mod+O" = {
          repeat = false;
          action = toggle-overview;
        };

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Right".action = move-column-right;

        "Mod+Up".action = focus-window-up;
        "Mod+Down".action = focus-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Down".action = move-window-down;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        "Mod+Page_Up".action = focus-workspace-up;
        "Mod+Page_Down".action = focus-workspace-down;
        "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
        "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
        "Mod+Shift+Page_Up".action = move-workspace-up;
        "Mod+Shift+Page_Down".action = move-workspace-down;

        # Mouse interactions
        "Mod+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-column-left;
        };
        "Mod+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-column-right;
        };
        "Mod+Shift+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-workspace-up;
        };
        "Mod+Shift+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-workspace-down;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          cooldown-ms = 150;
          action = move-column-left;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          cooldown-ms = 150;
          action = move-column-right;
        };
        "Mod+Ctrl+Shift+WheelScrollUp" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-up;
        };
        "Mod+Ctrl+Shift+WheelScrollDown" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-down;
        };

        # Consume and Expel
        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;
        "Mod+Semicolon".action = consume-or-expel-window-left;
        "Mod+Colon".action = consume-or-expel-window-right;

        # Column presets
        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;

        # Fullscreen
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Ctrl+F".action = expand-column-to-available-width;

        # Centering
        "Mod+C".action = center-column;
        "Mod+Ctrl+C".action = center-visible-columns;

        # Resize windows
        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+Ctrl+Minus".action = set-window-height "-10%";
        "Mod+Ctrl+Plus".action = set-window-height "+10%";

        # Floating
        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Mod+W".action = toggle-column-tabbed-display;

        # Screenshot
        "Print".action.screenshot = [ ];
        "Alt+Print".action.screenshot-window = [ ];
        "Ctrl+Print".action.screenshot-screen = [ ];

        "Mod+Shift+P".action = power-off-monitors;

        "Mod+Escape" = {
          action = toggle-keyboard-shortcuts-inhibit;
          allow-inhibiting = false;
        };

        # Launcher
        "Mod+Space".action = spawn-sh "noctalia-shell ipc call launcher toggle";

        # Terminal
        "Mod+Return".action = spawn "kitty";

        # Lockscreen
        "Mod+Alt+L".action = spawn "swaylock";

        # Multimedia
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl play-pause";
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl previous";
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl next";
        };
      };
    };
  };
}
