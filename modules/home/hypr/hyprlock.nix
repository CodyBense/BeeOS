{ config, ... }:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            background = [
                {
                    path = "/home/codybense/BeeOS/wallpapers/cm-aesthetic.jpg";
                    blur_passes = 3;
                    blur_size = 1;
                }
            ];

            input-field = [
                {
                    size = "200 30";
                    outline_thickness = 3;
                    dots_size = 0.3;
                    dots_center = true;
                    font_family = "JetBrains Mono Nerd Font Mono Semibold";
                    outer_color = "rgba(102, 92, 84, 1)";
                    inner_color = "rgba(60, 56, 54, 1)";
                    font_color = "rgba(189, 174, 147, 1)";
                    fade_on_empty = false;
                    placehold_text = "Password...";
                    check_color = "rgb(215, 153, 33)";
                    fail_color = "rgb(204, 36, 29)";
                    fail_text = "<i><b>Wrong password</b></i>";
                }
            ];
        };
    };
}
