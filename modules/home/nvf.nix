{ ... }:

{
    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                theme = {
                    enable = true;
                    name = "catppuccin";
                    style = "mocha";
                    transparent = true;
                };
                options = {
                    number = true;
                    relativenumber = true;

                    tabstop = 4;
                    softtabstop = 4;
                    shiftwidth = 4;
                    expandtab = true;

                    smartindent = true;

                    wrap = false;

                    hlsearch = false;
                    incsearch = true;

                    termguicolors = true;

                    scrolloff = 0;
                    signcolumn = "yes";
                    # isfname = append("@-@");

                    updatetime = 50;

                    colorcolumn = "80";

                };
                globals = {
                    mapleader = " ";
                };
                keymaps = [
                    # { # goes to tree explorer
                        # key = "<leader>pv";
                        # mode = "n";
                        # silent = true;
                        # action = "<cmd>Ex<CR>";
                    # }
                    {
                        key = "<leader>pv";
                        mode = "n";
                        silent = true;
                        action = "<cmd>Oil<CR>";
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

                statusline.lualine.enable = true;
                autocomplete.nvim-cmp.enable = true;

                languages = {
                    enableTreesitter = true;

                    nix = {
                        enable = true;
                        format.enable = true;
                        lsp.enable = true;
                        treesitter.enable = true;
                    };
                    python = {
                        enable = true;
                        dap.enable = true;
                        treesitter.enable = true;
                        format = {
                            enable = true;
                            type = "ruff";
                        };
                    };
                    bash = {
                        enable = true;
                        format.enable = true;
                        lsp.enable = true;
                        treesitter.enable = true;
                    };
                };

                lsp = {
                    enable = true;
                    mappings = {
                        goToDefinition = "<leader>gd";
                        goToDeclaration = "<leader>gD";
                    };
                    trouble = {
                        enable = true;
                        mappings = {
                            documentDiagnostics = "<leader>xx";
                            locList = "<leader>xl";
                            lspReferences = "<leader>lr";
                            quickfix = "<leader>xq";
                        };
                    };
                };
                navigation.harpoon = {
                    enable = true;
                    mappings = {
                        markFile = "<leader>a";
                        listMarks = "<C-e>";
                        file1 = "<C-1>";
                        file2 = "<C-2>";
                        file3 = "<C-3>";
                        file4 = "<C-4>";
                    };
                };
                terminal.toggleterm.lazygit = {
                    enable = true;
                    package = null;
                    direction = "float";
                    mappings.open = "<leader>lg";
                };
                telescope = {
                    enable = true;
                    mappings = {
                        findFiles = "<leader>pf";
                        liveGrep = "<leader>pg";
                    };
                };

                languages = {
                    markdown = {
                        enable = true;
                        extensions = {
                            render-markdown-nvim = {
                                enable = true;
                            };
                        };
                    };
                };

                utility = {
                    oil-nvim = {
                        enable = true;
                        setupOpts = {
                        };
                    };
                };
            };
        };
    };
}
