{ config, lib, pkgs, ... }:
{
    programs.wlogout = {
        enable = true;
        layout = [
            {
                label = "lock";
                action = "sleep 1; hyprlock";
                text = "Lock (L)";
                keybind = "l";
            }

            {
                label = "reboot";
                action = "sleep 1; systemctl reboot";
                text = "Reboot (R)";
                keybind = "r";
            }

            {
                label = "shutdown";
                action = "sleep 1; systemctl poweroff";
                text = "Shutdown (S)";
                keybind = "s";
            }

            {
                label = "logout";
                action = "sleep 1; hyprctl dispatch exit";
                text = "Logout (E)";
                keybind = "e";
            }

            {
                label = "suspend";
                action = "sleep 1; systemctl suspend";
                text = "Suspend (Z)";
                keybind = "z";
            }

            {
                label = "hibernate";
                action = "sleep 1; systemctl hibernate";
                text = "Hibernate (H)";
                keybind = "h";
            }

        ];

        style = ''
            window {
                font-family: BlexMono Nerd Font;
                font-size: 13pt;
                color: #f9e2af;
                background-color: #1e1e2e;
            }

            button {
                background-repeat: no-repeat;
                background-position: center;
                background-size: 50%;
                border-style: solid;
                border-radius: 4px;
                border-width: 2px;
                border-color: #f9e2af;
                background-color: #1e1e2e;
                color: #f9e2af;
                margin: 10px;
                transition:
                    box-shadow 0.3s ease-in-out,
                    background-color 0.3s ease-in-out;
            }

            button:hover {
                background-color: #a6e3a1;
                color: #11111b;
            }

            button:focus {
                background-color: #f38ba8;
                color: #11111b;
            }

            #lock {
                background-image: image(url("/home/codybense/BeeOS/config/wlogout/lock.png"));
            }

            #logout {
                background-image: image(url("/home/codybense/BeeOS/config/wlogout/logout.png"));
            }

            #suspend {
                background-image: image(url("/home/codybense/BeeOS/config/wlogout/suspend.png"));
            }

            #shutdown {
                background-image: image(url("/home/codybense/BeeOS/config/wlogout/shutdown.png"));
            }

            #reboot {
                background-image: image(url("/home/codybense/BeeOS/config/wlogout/reboot.png"));
            }

            #hibernate {
                background-image: image(url("/home/codybense/BeeOS/config/wlogout/hibernate.png"));
            }
        '';
    };
}
