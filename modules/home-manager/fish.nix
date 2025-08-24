{ config, pkgs, ...}:

{
    programs.fish = {
        enable = true;  # Add this line
        interactiveShellInit = ''
        set fish_greeting
        '';

        plugins = [
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
            { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
            { name = "done"; src = pkgs.fishPlugins.done.src; }
            { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
            { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
        ];

        shellAbbrs = {
        	nix = "cd ~/nixos";
            rebuild = "sudo nixos-rebuild switch --flake ~/nixos/.#camille";
            update = "nix flake update";

            grep = "grep -r 'example' . ";
            
            home = "micro ~/nixos/hosts/camille/home.nix";
            configuration = "micro ~/nixos/hosts/camille/configuration.nix";
        };
    };

    programs.bash = {
        initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''$BASH_EXECUTION_STRING }]]
        then
            shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
            exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
        '';	
    };
}
