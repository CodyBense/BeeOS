{ lib, username, host, config, ... }:

{
    options = {
        hyprland_module.enable = lib.mkEnableOption "enables hyprland_module";
    };

    config = lib.mkIf config.hyprland_module.enable {
        wayland.windowManager.hyprland = {
            enable = true;
            xwayland.enable = true;
            systemd.enable = false;
            settings = {
                monitor = ",preferred,auto,auto";
                exec-once = [
                    "hyprland-monitor-toggle"
                        "dbus-update-activation-environment --systemd -all"
                        "lxqt-policykit-agent"
                        "hyprpanel"
                ];
# "$terminal" = "ghostty";
# "$fileManager" = "thunar";
# "$browser" = "zen-browser";
# "$wallpaperSwitcher" = "wallsetter";

                env = [
                    "QT_QPA_PLATFORTHEME,qt5ct"
                        "PATH, $PATH:$scrPath"
                        "XDG_CURRENT_DESKTOP,Hyprland"
                        "XDG_SESSION_TYPE,wayland"
                        "XDG_SESSION_DEAKTOP,Hyprland"
                        "QT_QPA_PLATFORM,wayland"
                        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
                        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
                        "MQZ_ENABLE_WAYLAND,1"
                        "GDK_SCALE,1"
                        "GDK_BACKEND,wayland"
                        "GDK_BACKEND,wayland"
                        "GTK_USE_PORTAL,1"
                ];

                input = {
                    kb_layout = "us";
                    follow_mouse = "2";
                    touchpad = {
                        natural_scroll = "no";
                    };

                    sensitivity = "0";
                };

                device = {
                    name = "epic-mouse-v1";
                    sensitivity = "-0.5";
                };

                gestures = {
                    workspace_swipe = "true";
                    workspace_swipe_fingers = "3";
                };

                general = {
                    gaps_in = "0";
                    gaps_out = "0";
                    border_size = "2";
                    "col.active_border" = "rgb(A6E3A1)";
                    "col.inactive_border" = "rgb(1E1E2E)";
                    layout = "dwindle";
                    allow_tearing = "true";
                    resize_on_border = "true";
                };

                group = {
                    "col.border_active" = "rgb(B8BB26) rgb(EBDBB2) 45deg";
                    "col.border_inactive" = "rgb(282828) rgb(EBDBB2) 45deg";
                    "col.border_locked_active" = "rgb(B8BB26) rgb(EBDBB2) 45deg";
                    "col.border_locked_inactive" = "rgba(B4BEFECC) rgba(6C7086CC) 45deg";
                };

                decoration = {
                    rounding = "0";
                    dim_special = "0.3";
                    blur = {
                        enabled = "yes";
                        size = "10";
                        passes = "3";
                        new_optimizations = "on";
                        ignore_opacity = "on";
                        xray = "false";
                        special = "true";
                    };
                };

                animations = {
                    enabled = "no";
                };

                dwindle = {
                    pseudotile = "yes";
                    preserve_split = "yes";
                    force_split = "2";
                };

                master = {
                    new_status = "master";
                };

                misc = {
                    vrr = "0";
                    disable_hyprland_logo = "true";
                    disable_splash_rendering = "true";
                    force_default_wallpaper = "0";
                };

                xwayland = {
                    force_zero_scaling = "true";
                };

                layerrule = [
                    "blur,rofi"
                        "ignorezero,rofi"
                        "blur,notifications"
                        "ignorezero,notifications"
                        "blur,swaync-notification-window"
                        "ignorezero,swaync-notification-window"
                        "blur,swaync-control-center"
                        "ignorezero,swaync-control-center"
                        "blur,logout_dialog"
                        "blur,waybar"
                ];

                "$mainMod" = "SUPER";
                "$terminal" = "ghostty";
                "$broswer" = "zen-browser";
                "$fileManager" = "dolphin";
                "$menu" = "rofi --show drun";

                bind = [
                    "$mainMod, T, exec, $terminal"
                        "$mainMod, Q, killactive,"
                        "$mainMod, DELETE, exit,"
                        "$mainMod, E, exec, $fileManager"
                        "$mainMod, V, togglefloating,"
                        "$mainMod SHIFT, V, fullscreen "
                        "$mainMod, SPACE, exec, $scrPath/rofi-launch"
                        "$mainMod, P, pseudo,"
                        "$mainMod, F, exec,  flatpak run app.zen_browser.zen"
                        "$mainMod, M, exec, spotify"
                        "$mainMod, O, exec, obsidian"
                        "$mainMod, BACKSPACE, exec, wlogout"
                        "$mainMod, PERIOD, exec, $scrPath/emojipicker"
                        "$mainMod ALT, L, exec, hyprlock "
                        "$mainMod, H, movefocus, l"
                        "$mainMod, L, movefocus, r"
                        "$mainMod, K, movefocus, u"
                        "$mainMod, J, movefocus, d"
                        "$mainMod SHIFT, H, movewindow, l "
                        "$mainMod SHIFT, L, movewindow, r "
                        "$mainMod SHIFT, K, movewindow, u "
                        "$mainMod SHIFT, J, movewindow, d "
                        "$mainMod CTRL, H, resizeactive, -30 0 "
                        "$mainMod CTRL, L, resizeactive, 30 0 "
                        "$mainMod CTRL, J, resizeactive, 0 -30 "
                        "$mainMod CTRL, K, resizeactive, 0 30 "
                        "$mainMod, 1, workspace, 1 "
                        "$mainMod, 2, workspace, 2"
                        "$mainMod, 3, workspace, 3"
                        "$mainMod, 4, workspace, 4"
                        "$mainMod, 5, workspace, 5"
                        "$mainMod, 6, workspace, 6"
                        "$mainMod, 7, workspace, 7"
                        "$mainMod, 8, workspace, 8"
                        "$mainMod, 9, workspace, 9"
                        "$mainMod, 0, workspace, 10"
                        "$mainMod SHIFT, 1, movetoworkspace, 1 "
                        "$mainMod SHIFT, 2, movetoworkspace, 2 "
                        "$mainMod SHIFT, 3, movetoworkspace, 3 "
                        "$mainMod SHIFT, 4, movetoworkspace, 4 "
                        "$mainMod SHIFT, 5, movetoworkspace, 5 "
                        "$mainMod SHIFT, 6, movetoworkspace, 6 "
                        "$mainMod SHFIT, 7, movetoworkspace, 7 "
                        "$mainMod SHIFT, 8, movetoworkspace, 8 "
                        "$mainMod SHIFT, 9, movetoworkspace, 9 "
                        "$mainMod SHIFT, 0, movetoworkspace, 10 "
                        "$mainMod CTRL, 1, movetoworkspacesilent, 1 "
                        "$mainMod CTRL, 2, movetoworkspacesilent, 2 "
                        "$mainMod CTRL, 3, movetoworkspacesilent, 3 "
                        "$mainMod CTRL, 4, movetoworkspacesilent, 4 "
                        "$mainMod CTRL, 5, movetoworkspacesilent, 5 "
                        "$mainMod CTRL, 6, movetoworkspacesilent, 6 "
                        "$mainMod CTRL, 7, movetoworkspacesilent, 7 "
                        "$mainMod CTRL, 8, movetoworkspacesilent, 8 "
                        "$mainMod CTRL, 9, movetoworkspacesilent, 9 "
                        "$mainMod CTRL, 0, movetoworkspacesilent, 10 "
                        "$mainMod, S, togglespecialworkspace, magic"
                        "$mainMod SHIFT, S, movetoworkspace, special:magic"
                        "$mainMod SHIFT, I, togglesplit"
                        "$mainMod, mouse_down, workspace, e+1"
                        "$mainMod, mouse_up, workspace, e-1"
                        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
                        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
                        "$mainMod SHIFT, W, exec, bash $scrPath/rofi-wallpaper"
                        ", PrintScreen, exec, /home/codybense/.config/ags/services/snapshot"
                        "$mainMod SHIFT, home, exec, $scrPath/hyprland-monitor-toggle"
                        ];

                bindm = [
                    "$mainMod, mouse:272, movewindow"
                        "$mainMod, mouse:273, resizewindow"
                ];
            };
        };
    };
}
