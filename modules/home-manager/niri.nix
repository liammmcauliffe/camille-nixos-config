{ config, pkgs, ... }:

{
	programs.niri = {
	    settings = {
	          binds = with config.lib.niri.actions; {
	          "Mod+T".action = spawn "ghostty";
	          };
		};
	};
}
