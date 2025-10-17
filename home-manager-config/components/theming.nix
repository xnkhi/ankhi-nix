{ config, pkgs, ... }:

{
    catppuccin = {

        enable              =  true;

        accent              = "pink";
        flavor              = "mocha";

		gtk.icon.enable     =  true;
		gtk.icon.accent     = "pink";
		gtk.icon.flavor     = "mocha";

		swaylock.enable     =  true;
		swaylock.flavor     = "mocha";

		cursors.enable      =  true;
		cursors.accent      = "pink";
		cursors.flavor      = "mocha";

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

		vscode.profiles.Default.enable            =  true;
		vscode.profiles.Default.accent            = "pink";
		vscode.profiles.Default.flavor            = "mocha";
		vscode.profiles.Default.icons.enable      =  true;
		vscode.profiles.Default.icons.flavor      = "mocha";
		vscode.profiles.Default.settings.accent   = "mocha";


    };
}