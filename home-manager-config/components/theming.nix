{ config, pkgs, ... }:

{

	gtk = {

		enable = true;

		theme = {
			name = "Kali-Pink-Dark-Amoled";
		};

	};

	home.sessionVariables = {
    	GTK_THEME = config.gtk.theme.name;
		XDG_DATA_DIRS = "${config.home.homeDirectory}/.themes:${config.home.homeDirectory}/.local/share:${pkgs.gtk3}/share";
    	XCURSOR_THEME = config.gtk.cursorTheme.name;
    	XCURSOR_SIZE = "24";
  	};

}