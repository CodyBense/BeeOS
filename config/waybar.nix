{ pkgs, ... }:
{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = [{
            position = "top";
            modules-left = [ "hyprland/workspaces" ];
            modules-center = [ "clock" ];
            modules-right = [ "pulseaudio" "network" "backlight" "battery" "power-profiles-daemon" ];

            # "hyprland/workspaces" = {
            #     disable-scroll = true;
            #     all-outputs = true;
            #     warp-on-scroll = false;
            # };
            clock = {
                format = "<span foreground='#f5c2e7'>  </span>{:%a %d %H:%M}";
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            };

            battery = {
                states = {
                    warning = 30;
                    critical = 15;
                };
                format = "<span size='13000' foreground='#a6e3a1'>{icon} </span> {capacity}%";
                format-warning = "<span size='13000' foreground='#B1E3AD'>{icon} </span> {capacity}%";
                format-critical = "<span size='13000' foreground='#E38C8F'>{icon} </span> {capacity}%";
                format-charging = "<span size='13000' foreground='#B1E3AD'> </span>{capacity}%";
                format-plugged = "<span size='13000' foreground='#B1E3AD'> </span>{capacity}%";
                format-alt = "<span size='13000' foreground='#B1E3AD'>{icon} </span> {time}";
                format-full = "<span size='13000' foreground='#B1E3AD'> </span>{capacity}%";
                format-icons = ["" "" "" "" ""];
                tooltip-format = "{time}";
            };
            network = {
                format-wifi = "<span size='13000' foreground='#f5e0dc'>  </span>{essid}";
                format-ethernet = "<span size='13000' foreground='#f5e0dc'>󰤭  </span> Disconnected";
                format-linked = "{ifname} (No IP) ";
                format-disconnected = "<span size='13000' foreground='#f5e0dc'>  </span>Disconnected";
                tooltip-format-wifi = "Signal Strenght: {signalStrength}%";
                on-click = "rofi-wifi";
            };
            pulseaudio = {
                format = "{icon}  {volume}%";
                format-muted = "";
                format-icons = {
                    default = ["" "" " "];
                };
                on-click = "pavucontrol";
            };
            backlight = {
                format = "{icon} {percent}%";
                format-icons = ["" "" "" "" "" "" "" "" ""];
            };
            power-profiles-daemon = {
                format = "{icon}";
                tooltip-format = "Power profile: {profile}\nDriver: {driver}";
                tooltip = true;
                format-icons = {
                    default = "";
                    performance = "";
                    balanced = "";
                    power-saver = "";
                };
            };
        }
    };];
    style = ''
        /* @import "mocha.css";  */
        @define-color rosewater #f5e0dc;
        @define-color flamingo #f2cdcd;
        @define-color pink #f5c2e7;
        @define-color mauve #cba6f7;
        @define-color red #f38ba8;
        @define-color maroon #eba0ac;
        @define-color peach #fab387;
        @define-color yellow #f9e2af;
        @define-color green #a6e3a1;
        @define-color teal #94e2d5;
        @define-color sky #89dceb;
        @define-color sapphire #74c7ec;
        @define-color blue #89b4fa;
        @define-color lavender #b4befe;
        @define-color text #cdd6f4;
        @define-color subtext1 #bac2de;
        @define-color subtext0 #a6adc8;
        @define-color overlay2 #9399b2;
        @define-color overlay1 #7f849c;
        @define-color overlay0 #6c7086;
        @define-color surface2 #585b70;
        @define-color surface1 #45475a;
        @define-color surface0 #313244;
        @define-color base #1e1e2e;
        @define-color mantle #181825;
        @define-color crust #11111b;

        * {
            font-family: "JetBrainsMono Nerd Font Mono";
            font-size: 16px;
            min-height: 0;
            font-weight: bold;
        }

        window#waybar {
            background: transparent;
            background-color: @crust;
            color: @overlay0;
            transition-property: background-color;
            transition-duration: 0.1s;
            border-bottom: 1px solid @overlay1;
        }

        #window {
            margin: 8px;
            padding-left: 8;
            padding-right: 8;
        }

        button {
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 0;
        }

        button:hover {
            background: inherit;
            color: @mauve;
            border-top: 2px solid @mauve;
        }

        #workspaces button {
            padding: 0 4px;
        }

        #workspaces button.focused {
            background-color: rgba(0, 0, 0, 0.3);
            color: @rosewater;
            border-top: 2px solid @rosewater;
        }

        #workspaces button.active {
            background-color: rgba(0, 0, 0, 0.3);
            color: @mauve;
            border-top: 2px solid @mauve;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #pulseaudio,
        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #wireplumber,
        #tray,
        #network,
        #mode,
        #backlight,
        #power-profiles-daemon,
        #scratchpad {
          margin-top: 2px;
          margin-bottom: 2px;
          margin-left: 4px;
          margin-right: 4px;
          padding-left: 4px;
          padding-right: 4px;
        }

        #clock {
            color: @maroon;
            border-bottom: 2px solid @maroon;
        }

        #clock.date {
            color: @mauve;
            border-bottom: 2px solid @mauve;
        }

        #pulseaudio {
            color: @blue;
            border-bottom: 2px solid @blue;
        }

        #network {
            color: @peach;
            border-bottom: 2px solid @peach;
        }


        #battery {
            color: @green;
            border-bottom: 2px solid @green;
        }

        #backlight {
            color: @yellow;
            border-bottom: 2px solid @yellow;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left>widget:first-child>#workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right>widget:last-child>#workspaces {
            margin-right: 0;
        }

        #custom-vpn {
            color: @lavender;
            border-radius: 15px;
            padding-left: 6px;
            padding-right: 6px;
        }

        #power-profiles-daemon.performance {
            color: @red;
        }
        #power-profiles-daemon.balanced {
            color: @blue;
        }
        #power-profiles-daemon.power-saver {
            color: @green;
        }
    ''
}
