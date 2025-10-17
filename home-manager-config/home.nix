{ config, pkgs, ... }:
{

	home.username = "ankhi";
	home.homeDirectory = "/home/ankhi";
	home.stateVersion = "25.05";

	imports = [
		./components/packages.nix
		./components/services.nix
		./components/program-settings.nix
		./components/files.nix
		./components/theming.nix
  	];

}