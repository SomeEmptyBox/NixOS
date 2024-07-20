{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

    monitor = ", 1920x1080, 0x0, 1.2";

    env = [     
      "GDK_BACKEND,wayland"
      "SDL_VIDEODRIVER,wayland"
      "CLUTTER_BACKEND,wayland"

      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME,qt6ct"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
    ];

    exec-once = [
      "clipse -listen"
    ];

    windowrule = [
      "fakefullscreen,(.*)"

      "float,(clipse)"
      "size 622 652,(clipse)"

      "float,(imv)"
      "center,(imv)"
      "size 80% 80%,(imv)"
    ];

    general = {
      border_size = 3;
      gaps_in = 4;
      gaps_out = 10;
      layout = "master";
      "col.active_border" = "$red";
      "col.inactive_border" = "$blue";
      resize_on_border = true;
    };

    master = {
      mfact = 0.5;
      new_status = "master";
    };

    decoration = {
      rounding = 5;
      drop_shadow = false;
      blur.enabled = false;
    };

    input.touchpad = {
      natural_scroll = true;
      drag_lock = true;
      tap-and-drag = true;
    };

    gestures = {
      workspace_swipe = true;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      font_family = "JetBrainsMonoNerdFont";
      vrr = 1;
    };

    # Programs
    "$terminal" = "alacritty";
    "$menu" = "rofi -show drun";
    "$file" = "superfile";
    "$browser" = "firefox";

    # Keys
    "$mod" = "SUPER";
    "$alt" = "ALT";

    bind = [
      "$mod, A, exec, $menu"
      "$mod, B, exec, $browser"
      "$mod, E, exec, $terminal -e $file"
      "$mod, F, fullscreen, 1"
      "$mod, T, exec, $terminal"
      "$mod, V, exec, $terminal --class clipse -e zsh -c 'clipse'"

      "$mod, TAB, layoutmsg, rollnext"
      "$mod, Q, layoutmsg, mfact -0.05"
      "$mod, W, layoutmsg, mfact +0.05"
      
      "$mod, ESCAPE, killactive"
      "$mod SHIFT, ESCAPE, exit"

      "$alt, F, fakefullscreen"

      # Screenshot
      ", PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
      "$mod, PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"
      "SHIFT, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"

      # Function Keys
      ", code:121, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", code:122, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", code:123, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 2.0"
      ", code:232, exec, brightnessctl set 5%-"
      ", code:233, exec, brightnessctl set +5%"

      # Move Focus with $mod + Arrow keys
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      # Switch workspace with $mod + [0-9]
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      # Scratchpad
      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"
    ];
  };

  services.hyprpaper = {
    enable = true;
    settings = {

      "$wall" = "~/NixOS/wallpapers";
    
      preload = [
        "$wall/nixos-catppuccin-latte.png"
        "$wall/nixos-catppuccin-mocha.png"
        "$wall/nixos-catppuccin-mocha-simple.png"
      ];

      wallpaper = [",$wall/nixos-catppuccin-mocha.png"];
    };
  };
}
