{ config, pkgs, ... }:

{

	gtk = {

		enable = true;

		cursorTheme = {
			name = "Catppuccin Mocha Pink";
			package = pkgs.catppuccin-cursors.mochaPink;
		};

		iconTheme = {
			name = "Papirus-Dark";
			package = pkgs.catppuccin-papirus-folders.override {
				flavor = "mocha";
				accent = "pink";
			};
		};


		theme = {
			name = "catppuccin-mocha-pink-standard";
			package = pkgs.catppuccin-gtk.override {
				variant = "mocha";
				accents = [ "pink" ];
			};
		};

	};

	home.sessionVariables = {
    	GTK_THEME = config.gtk.theme.name;
    	XCURSOR_THEME = config.gtk.cursorTheme.name;
    	XCURSOR_SIZE = "24";
  	};

}