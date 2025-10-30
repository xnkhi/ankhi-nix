{ config, pkgs, ... }:

{

	gtk = {

		enable = true;

		cursorTheme = {
			name = "Catppuccin Mocha Pink";
			package = pkgs.catppuccin-cursors.mochaPink;
		};

		iconTheme = {
			name = "Windows 10";
			package = pkgs.windows10-icons;
		};


		theme = {
			name = "Venta Dark";
			package = pkgs.venta;
		};

	};

	home.sessionVariables = {
    	GTK_THEME = config.gtk.theme.name;
    	XCURSOR_THEME = config.gtk.cursorTheme.name;
    	XCURSOR_SIZE = "24";
  	};

}