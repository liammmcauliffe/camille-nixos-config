{ config, pkgs, ... }:

{
	services.greetd.enable = true;
	services.greetd.settings = {
		default_session = {
			command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd niri-session";
			user = "poilk";
		};
	};
}
