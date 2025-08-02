{ ... }:

{
    programs.nvf = {
        settings = {
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
        };
    };
}
