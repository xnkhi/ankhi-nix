{ config, pkgs, ... }:

{

	# catppuccin vscodium extensions at .assets/vscodium-extensions imported by ./files.nix

  catppuccin = {

		swaylock.enable     =  true;
		swaylock.flavor     = "mocha";

		nvim.enable         =  true;
		nvim.flavor         = "mocha";

    btop.enable         =  true;
		btop.flavor         = "mocha";

		obs.enable          =  true;
		obs.flavor          = "mocha";

		vesktop.enable      =  true;
		vesktop.accent      = "pink";
		vesktop.flavor      = "mocha";

		zsh-syntax-highlighting.enable     =  true;
		zsh-syntax-highlighting.flavor     = "mocha";

	};

	gtk = {

		enable = true;

		cursorTheme = {
			name = "Catppuccin-Mocha-Pink-Cursors";
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
			name = "Catppuccin-Mocha-Pink-Dark";
			package = pkgs.catppuccin-gtk.override {
				accents = [ "pink" ];
				variant = "mocha";
			};
		};

	};

	home.sessionVariables = {
    	GTK_THEME = config.gtk.theme.name;
    	XCURSOR_THEME = config.gtk.cursorTheme.name;
    	XCURSOR_SIZE = "24";
  	};

}