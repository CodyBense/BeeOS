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
                    bind "Ctrl l" { SwitchToMode "Locked"; }
                    //bind "Ctrl p" { SwitchToMode "Pane"; }
                    //bind "Ctrl t" { SwitchToMode "Tab"; }
                    //bind "Ctrl n" { SwitchToMode "Move"; }
                    //bind "Ctrl o" { SwitchToMode "Session"; }
                    //bind "Ctrl q" { Quit; }
                }

                locked {
                    bind "Ctrl l" { SwitchToMode "Normal"; }
                }
                
                resize {
                    bind "Ctrl Tab" { SwitchToMode "Normal"; }
                    bind "h" "Left" { Resize "Increase Left"; }
                    bind "j" "Down" { Resize "Increase Down"; }
                    bind "k" "Up" { Resize "Increase Up"; }
                    bind "l" { Resize "Increase Right"; }
                    bind "H" { Resize "Decrease Left"; }
                    bind "J" { Resize "Decrease Down"; }
                    bind "K" { Resize "Decrease Up"; }
                    bind "L" { Resize "Decrease Right"; }
                    bind "=" "+" { Resize "Increase"; }
                    bind "-" { Resize "Increase"; }
                }

                pane {
                    bind  "Ctrl p" { SwitchToMode "Normal"; }
                    bind "h" "Left" { MoveFocus "Left"; }
                    bind "j" "Down" { MoveFocus "Down"; }
                    bind "k" "Up" { MoveFocus "Up"; }
                    bind "l" { MoveFocus "Right"; }
                    bind "p" { SwitchFocus; }
                    bind "n" { NewPane; SwitchToMode "Normal"; }
                    bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
                    bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
                    bind "x" { CloseFocus; SwitchToMode "Normal"; }
                    bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
                    bind "z" { TogglePaneFrames; SwitchToMode "Normal"; }
                    bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
                    bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
                    bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0; }
                    bind "i" { TogglePanePinned; SwitchToMode "Normal"; }
                }
                move {
                    bind "Ctrl h" { SwitchToMode "Normal"; }
                    bind "n" "Tab" { MovePane; }
                    bind "p" { MovePaneBackwards; }
                    bind "h" "Left" { MovePane "Left"; }
                    bind "j" "Down" { MovePane "Down"; }
                    bind "k" "Up" { MovePane "Up"; }
                    bind "l" "Right" { MovePane "Right"; }
                }
                tab {
                    bind "Ctrl t" { SwitchToMode "Normal"; }
                    bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
                    bind "h" "Left" "Up" "k" { GoToPreviousTab; }
                    bind "l" "Right" "Down" "j" { GoToNextTab; }
                    bind "n" { NewTab; SwitchToMode "Normal"; }
                    bind "x" { CloseTab; SwitchToMode "Normal"; }
                    bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }
                    bind "b" { BreakPane; SwitchToMode "Normal"; }
                    bind "]" { BreakPaneRight; SwitchToMode "Normal"; }
                    bind "[" { BreakPaneLeft; SwitchToMode "Normal"; }
                    bind "1" { GoToTab 1; SwitchToMode "Normal"; }
                    bind "2" { GoToTab 2; SwitchToMode "Normal"; }
                    bind "3" { GoToTab 3; SwitchToMode "Normal"; }
                    bind "4" { GoToTab 4; SwitchToMode "Normal"; }
                    bind "5" { GoToTab 5; SwitchToMode "Normal"; }
                    bind "6" { GoToTab 6; SwitchToMode "Normal"; }
                    bind "7" { GoToTab 7; SwitchToMode "Normal"; }
                    bind "8" { GoToTab 8; SwitchToMode "Normal"; }
                    bind "9" { GoToTab 9; SwitchToMode "Normal"; }
                    bind "Tab" { ToggleTab; }
                }
                scroll {
                    bind "Ctrl s" { SwitchToMode "Normal"; }
                    bind "e" { EditScrollback; SwitchToMode "Normal"; }
                    bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
                    bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
                    bind "j" "Down" { ScrollDown; }
                    bind "k" "Up" { ScrollUp; }
                    bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
                    bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
                    bind "d" { HalfPageScrollDown; }
                    bind "u" { HalfPageScrollUp; }
                    // uncomment this and adjust key if using copy_on_select=false
                    // bind "Alt c" { Copy; }
                }
                search {
                    bind "Ctrl s" { SwitchToMode "Normal"; }
                    bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
                    bind "j" "Down" { ScrollDown; }
                    bind "k" "Up" { ScrollUp; }
                    bind "Ctrl f" "PageDown" "Right" "l" { PageScrollDown; }
                    bind "Ctrl b" "PageUp" "Left" "h" { PageScrollUp; }
                    bind "d" { HalfPageScrollDown; }
                    bind "u" { HalfPageScrollUp; }
                    bind "n" { Search "down"; }
                    bind "p" { Search "up"; }
                    bind "c" { SearchToggleOption "CaseSensitivity"; }
                    bind "w" { SearchToggleOption "Wrap"; }
                    bind "o" { SearchToggleOption "WholeWord"; }
                }
                entersearch {
                    bind "Ctrl c" "Esc" { SwitchToMode "Scroll"; }
                    bind "Enter" { SwitchToMode "Search"; }
                }
                renametab {
                    bind "Ctrl c" { SwitchToMode "Normal"; }
                    bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
                }
                renamepane {
                    bind "Ctrl c" { SwitchToMode "Normal"; }
                    bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
                }
                session {
                    bind "Ctrl o" { SwitchToMode "Normal"; }
                    bind "Ctrl s" { SwitchToMode "Scroll"; }
                    bind "d" { Detach; }
                    bind "w" {
                        LaunchOrFocusPlugin "session-manager" {
                            floating true
                            move_to_focused_tab true
                        };
                        SwitchToMode "Normal"
                    }
                    bind "c" {
                        LaunchOrFocusPlugin "configuration" {
                            floating true
                            move_to_focused_tab true
                        };
                        SwitchToMode "Normal"
                    }
                    bind "p" {
                        LaunchOrFocusPlugin "plugin-manager" {
                            floating true
                            move_to_focused_tab true
                        };
                        SwitchToMode "Normal"
                    }
                    bind "a" {
                        LaunchOrFocusPlugin "zellij:about" {
                            floating true
                            move_to_focused_tab true
                        };
                        SwitchToMode "Normal"
                    }
                }
                tmux {
                    bind "[" { SwitchToMode "Scroll"; }
                    bind "Ctrl b" { Write 2; SwitchToMode "Normal"; }
                    bind "\"" { NewPane "Down"; SwitchToMode "Normal"; }
                    bind "%" { NewPane "Right"; SwitchToMode "Normal"; }
                    bind "z" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
                    bind "c" { NewTab; SwitchToMode "Normal"; }
                    bind "," { SwitchToMode "RenameTab"; }
                    bind "p" { GoToPreviousTab; SwitchToMode "Normal"; }
                    bind "n" { GoToNextTab; SwitchToMode "Normal"; }
                    bind "Left" { MoveFocus "Left"; SwitchToMode "Normal"; }
                    bind "Right" { MoveFocus "Right"; SwitchToMode "Normal"; }
                    bind "Down" { MoveFocus "Down"; SwitchToMode "Normal"; }
                    bind "Up" { MoveFocus "Up"; SwitchToMode "Normal"; }
                    bind "h" { MoveFocus "Left"; SwitchToMode "Normal"; }
                    bind "l" { MoveFocus "Right"; SwitchToMode "Normal"; }
                    bind "j" { MoveFocus "Down"; SwitchToMode "Normal"; }
                    bind "k" { MoveFocus "Up"; SwitchToMode "Normal"; }
                    bind "o" { FocusNextPane; }
                    bind "d" { Detach; }
                    bind "Space" { NextSwapLayout; }
                    bind "x" { CloseFocus; SwitchToMode "Normal"; }
                }
                shared_except "locked" {
                    bind "Ctrl g" { SwitchToMode "Locked"; }
                    bind "Ctrl q" { Quit; }
                    bind "Alt f" { ToggleFloatingPanes; }
                    bind "Alt n" { NewPane; }
                    bind "Alt i" { MoveTab "Left"; }
                    bind "Alt o" { MoveTab "Right"; }
                    bind "Alt h" "Alt Left" { MoveFocusOrTab "Left"; }
                    bind "Alt l" "Alt Right" { MoveFocusOrTab "Right"; }
                    bind "Alt j" "Alt Down" { MoveFocus "Down"; }
                    bind "Alt k" "Alt Up" { MoveFocus "Up"; }
                    bind "Alt =" "Alt +" { Resize "Increase"; }
                    bind "Alt -" { Resize "Decrease"; }
                    bind "Alt [" { PreviousSwapLayout; }
                    bind "Alt ]" { NextSwapLayout; }
                }
                shared_except "normal" "locked" {
                    bind "Enter" "Esc" { SwitchToMode "Normal"; }
                }
                shared_except "pane" "locked" {
                    bind "Ctrl p" { SwitchToMode "Pane"; }
                }
                shared_except "resize" "locked" {
                    bind "Ctrl n" { SwitchToMode "Resize"; }
                }
                shared_except "scroll" "locked" {
                    bind "Ctrl s" { SwitchToMode "Scroll"; }
                }
                shared_except "session" "locked" {
                    bind "Ctrl o" { SwitchToMode "Session"; }
                }
                shared_except "tab" "locked" {
                    bind "Ctrl t" { SwitchToMode "Tab"; }
                }
                shared_except "move" "locked" {
                    bind "Ctrl h" { SwitchToMode "Move"; }
                }
                shared_except "tmux" "locked" {
                    bind "Ctrl b" { SwitchToMode "Tmux"; }
                }
            }
            '';
        };
}
