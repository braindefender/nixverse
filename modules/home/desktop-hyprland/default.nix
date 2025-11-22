{ pkgs, ... }:

let
  script_startup = pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img "${pkgs.hyprland}/share/hyprland/wall2.png" &
  '';
in

{
  imports = [ ../desktop-wayland ];

  home.packages = with pkgs; [
    swww
    wl-clipboard
    wev
    wofi
  ];

  programs.zsh.loginExtra = ''
    if [ -z "''${DISPLAY}" ] && [ $(tty) = "/dev/tty1" ]; then
      dbus-run-session Hyprland
    fi
  '';

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        ''${script_startup}/bin/start''
        ''nm-applet --indicator''
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"

        "$mod CTRL, left,  workspace, -1"
        "$mod CTRL, right, workspace, +1"

        "$mod CTRL SHIFT, left,  movetoworkspace, -1"
        "$mod CTRL SHIFT, right, movetoworkspace, +1"

        "$mod, Space, exec, ${pkgs.rofi}/bin/rofi -show combi"
        "$mod, V, exec, ${pkgs.rofi}/bin/rofi --show rofi-vpn"
        "$mod, Return, exec, ${pkgs.kitty}/bin/kitty"
        "$mod, Escape, exit"
        "$mod, Q, killactive"
        "$mod, H, togglefloating"
        "$mod, R, togglesplit"
        "$mod, F, fullscreen"
        "$mod SHIFT, F, forcerendererreload"
        "$mod SHIFT, R, exec, ${pkgs.hyprland}/bin/hyprctl reload"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      input = {
        follow_mouse = 1; # https://wiki.hyprland.org/Configuring/Variables/#follow-mouse-cursor
        repeat_delay = 250;
        numlock_by_default = 1;
        kb_model = "ulo";
        kb_layout = "ulo";
        kb_variant = "";
        kb_options = "lv3:ralt_switch";
        kb_file = "/etc/X11/xkb/symbols/ulo";
      };

      general = {
        border_size = 2;
        gaps_in = 4;
        gaps_out = 8;
        layout = "master";
      };

      master = {
        mfact = 0.66;
      };

      animations = {
        enabled = false;
      };

      decoration = {
        rounding = 8;
        fullscreen_opacity = 1;
        inactive_opacity = 0.9;
        active_opacity = 1;
      };

      decoration.shadow = {
        enabled = false;
      };

      monitor = "HDMI-A-1, 3440x1440@100, auto, 1";

      windowrulev2 = [
        "float, class:^(code)$, title:^(Open File)$"
        "float, class:^(nm-connection-editor)$"
        "tile, class:^(virt-manager)$"
        "tile, class:^(Vivaldi-stable)$"
      ];
    };

  };
}
