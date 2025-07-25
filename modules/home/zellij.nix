{ ... }:

{
    programs.zellij = {
        enable = true;
    };

    home.file.zellij = {
        target = ".config/zellij/config.kdl";
        text = ''
            show_startup_tips false
            theme "catppuccin-mocha"
            themes {
                catppuccin-mocha {
                    text-unslected {
                        base 205 214 244
                        background 24 24 37
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    text_selected {
                        base 205 214 244
                        background 88 91 112
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    ribbon_selected {
                        base 24 24 37
                        background 166 227 161
                        emphasis_0 243 139 168
                        emphasis_1 250 179 135
                        emphasis_2 245 194 231
                        emphasis_3 137 180 250
                    }
                    ribbon_unselected {
                        base 24 24 37
                        background 205 214 244
                        emphasis_0 243 139 168
                        emphasis_1 205 214 244
                        emphasis_2 137 180 250
                        emphasis_3 245 194 231
                    }
                    table_title {
                        base 166 227 161
                        background 0
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    table_cell_selected {
                        base 205 214 244
                        background 88 91 112
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    table_cell_unselected {
                        base 205 214 244
                        background 24 24 37
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    list_selected {
                        base 205 214 244
                        background 88 91 112
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    list_unselected {
                        base 205 214 244
                        background 24 24 37
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 166 227 161
                        emphasis_3 245 194 231
                    }
                    frame_selected {
                        base 166 227 161
                        background 0
                        emphasis_0 250 179 135
                        emphasis_1 137 220 235
                        emphasis_2 245 194 231
                        emphasis_3 0
                    }
                    frame_highlight {
                        base 250 179 135
                        background 0
                        emphasis_0 245 194 231
                        emphasis_1 250 179 135
                        emphasis_2 250 179 135
                        emphasis_3 250 179 135
                    }
                    exit_code_success {
                        base 166 227 161
                        background 0
                        emphasis_0 137 220 235
                        emphasis_1 24 24 37
                        emphasis_2 245 194 231
                        emphasis_3 137 180 250
                    }
                    exit_code_error {
                        base 243 139 168
                        background 0
                        emphasis_0 249 226 175
                        emphasis_1 0
                        emphasis_2 0
                        emphasis_3 0
                    }
                    multiplayer_user_colors {
                        player_1 245 194 231
                        player_2 137 180 250
                        player_3 0
                        player_4 249 226 175
                        player_5 137 220 235
                        player_6 0
                        player_7 243 139 168
                        player_8 0
                        player_9 0
                        player_10 0
                    }
                }
            }

            keybinds {
                normal {
                    bind "Ctrl l" { SwitchToMode "locked"; }
                    bind "Ctrl p" { SwitchToMode "pane"; }
                    bind "Ctrl t" { SwitchToMode "tab"; }
                    bind "Ctrl n" { SwitchToMode "move"; }
                    bind "Ctrl o" { SwitchToMode "session"; }
                    bind "Ctrl q" { Quit; }
                }

                locked {
                    bind "Ctrl l" { SwitchToMode "normal"; }
                }
            }
            '';
        };
}
