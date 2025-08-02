{ ... }:

{
    programs.nvf = {
        settings = {
            lsp = {
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
        };
    };
}
