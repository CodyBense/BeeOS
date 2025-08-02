{ pkgs, lib, ... }:

{
    programs.nvf = {
        # enable = true;
        settings = {
            vim = {
                keymaps = [
                    { # goes to tree explorer
                        key = "<leader>pv";
                        mode = "n";
                        silent = true;
                        action = "<cmd>Ex<CR>";
                    }
                    { # moves selected lines and autoindents
                        key = "J";
                        mode = "v";
                        silent = true;
                        action = ":m '>+1<CR>gv=gv";
                    }
                    { # moves selected lines and autoindents
                        key = "K";
                        mode = "v";
                        silent = true;
                        action = ":m '<-2<CR>gv=gv";
                    }
                    { # add next line at end and keeps cursor in current position
                        key = "J";
                        mode = "n";
                        silent = true;
                        action = "mzj`z";
                    }
                    { # half page jumps and keeps cursor centered
                        key = "<C-d>";
                        mode = "n";
                        silent = true;
                        action = "<C-d>zz";
                    }
                    { # half page jumps and keeps cursor centered
                        key = "<C-u>";
                        mode = "n";
                        silent = true;
                        action = "<C-u>zz";
                    }
                    { # keeps cursor in place when searching terms 
                        key = "n";
                        mode = "n";
                        silent = true;
                        action = "nzzzv";
                    }
                    { # keeps cursor in place when searching terms 
                        key = "N";
                        mode = "n";
                        silent = true;
                        action = "Nzzzv";
                    }
                    { # copys over and puts replace in void reg
                        key = "<leader>p";
                        mode = "x";
                        silent = true;
                        action = "\"_dP";
                    }
                    { # copys to computer clipboard
                        key = "<leader>y";
                        mode = ["n" "v"];
                        silent = true;
                        action = "\"+y";
                    }
                    { # copys to computer clipboard
                        key = "<leader>Y";
                        mode = ["n" "v"];
                        silent = true;
                        action = "\"+Y";
                    }
                    { # delete to void reg
                        key = "<leader>d";
                        mode = ["n" "v"];
                        silent = true;
                        action = "\"_d";
                    }
                    {
                        key = "Q";
                        mode = "n";
                        silent = true;
                        action = "<nop>";
                    }
                ];
            };
        };
    };
}
