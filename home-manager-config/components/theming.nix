{ config, pkgs, ... }:

{

	# catppuccin vscodium extensions at .assets/vscodium-extensions imported by ./files.nix

  catppuccin = {

    enable              =  true;

    accent              = "pink";
  	flavor              = "mocha";

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

		cursorTheme.package = pkgs.catppuccin-cursors.mochaPink;

		iconTheme.package = pkgs.catppuccin-papirus-folders.override {
			flavor = "mocha";
			accent = "pink";
		};


		theme = {
			name = "Catppuccin-Mocha-Pink-Dark";
			package = pkgs.catppuccin-gtk.override {
				accents = "pink";
				variant = "mocha";
			};
		};

	};

	xdg.configFile = {
		"gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
		"gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
		"gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
	};

}