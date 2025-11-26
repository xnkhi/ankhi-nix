{ config, pkgs, ... }:

{

	gtk = {
		
		enable = true;

		theme.name       = "amoled";
		iconTheme.name   = "windows-7-monochrome";

		gtk3.extraConfig = {
			"gtk-application-prefer-dark-theme" = true;
		};
		gtk4.extraConfig = {
			"gtk-application-prefer-dark-theme" = true;
		};

	};

	qt = {
		enable = true;
		platformTheme = "qtct";
		style.name = "kvantum";
	};

	home.sessionVariables = {
    	XCURSOR_SIZE   = "24";
    	GTK_THEME      = "amoled";
		ICON_THEME     = "windows-7-monochrome";
  	};

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
		};
	};

}