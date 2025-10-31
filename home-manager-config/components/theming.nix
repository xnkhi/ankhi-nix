{ config, pkgs, ... }:

{

	gtk = {
		
		enable = true;

		gtk3.extraConfig = {
			"gtk-application-prefer-dark-theme" = true;
		};
		gtk4.extraConfig = {
			"gtk-application-prefer-dark-theme" = true;
		};

	};

	home.sessionVariables = {
    	XCURSOR_SIZE = "24";
    	GTK_THEME = "amoled";
  	};

}