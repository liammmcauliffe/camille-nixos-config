{ config, pkgs, ...}:

{
	programs.fish = {
		enable=true;

		interactiveShellInit = ''
		set fish_greeting
		'';

		plugins = [
			{ name = "grc"; src = pkgs.fishPlugins.grc.src; }
			{ name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
			{ name = "done"; src = pkgs.fishPlugins.done; }
			{ name = "forgit"; src = pkgs.fishPlugins.forgit; }
			{ name = "hydro"; src = pkgs.fishPlugins.hydro; }
		];
	};

	programs.bash = {
	initExtra = ''
	if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''$BASH_EXECUTION_STRING} ]]
	then
		shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
		exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
		fi
	'';	
	};
}
