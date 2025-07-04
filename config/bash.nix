{ ... }:

{
    programs = {
        bash = {
            enable = true;
            enableCompletion = true;
            historyFile = "/home/codybense/.cache/history";
            historyFileSize = 1000;
            historySize = 1000;
            shellAliases = {
                c = "clear";
                v = "nvim";
                vi = "nvim";
                iv = ''nvim $(fzf --preview="bat --color=always {}")'';
                sv = "sudo nvim";
                ll = "ls -l";
                la = "ls -a";
                ls = "ls --color=auto";
                grep = "grep --color=auto";
                mkdir = "mkdir -p";
                cat = "bat";
                ".." = "cd ..";
                "2." = "cd ../..";
                "3." = "cd ../../..";
                "4." = "cd ../../../..";
                py = "python3";
                lg = "lazygit";
                yazi = "flatpak run io.github.sxyazi.yazi";
            };
            initExtra = ''
                export PATH=$PATH:$HOME/go/bin
                export MANPAGER='nvim +Man!'
                export PATH="$PATH:/home/codybense/.local/bin"
                export PYENV_ROOT="$HOME/.pyenv"
                [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
                eval "$(fzf --bash)"
                eval "$(starship init bash)"
                eval "$(direnv hook bash)"
                eval "$(zoxide init bash)"
                '';
        };
        pyenv.enableBashIntegration = true;
        fzf.enableBashIntegration = true;
        starship.enableBashIntegration = true;
        direnv.enableBashIntegration = true;
        zoxide.enableBashIntegration = true;
    };
}
