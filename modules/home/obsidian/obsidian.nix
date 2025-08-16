{ pkgs, ... }:

{
    programs.obsidian = {
        enable = true;
        defaultSettings = { 
            app = {
                defaultViewMode = "preview";
                livePreview = false;
                showLineNumber = true;
            };

            appearance = {
                baseColorScheme = "dark";
            };

            themes = [
                # (pkgs.callPackage ./Catppuccin {})
            ];

            communityPlugins = [
                
            ];

        };

        # vaults = {
        #     "Documents/Obsidian/daily_notes" = {
        #         enable = true;
        #     };
        #     "Documents/Obsidian/projects" = {
        #         enable = true;
        #     };
        # };
    };
}
