{ config, pkgs, ... }:
{

	home.username = "ankhi";
	home.homeDirectory = "/home/ankhi";
	home.stateVersion = "25.05";

	home.sessionPath = [
		"/home/ankhi/.scripts"
	];

	imports = [
		./components/home-packages.nix
		./components/home-services.nix
		./components/home-program-settings.nix
		./components/home-files.nix
		./components/home-theming.nix
  	];

}