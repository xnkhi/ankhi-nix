{ config, pkgs, ... }:

{
	home.file.".config/fastfetch".source         = ./assets/.config/fastfetch;

	home.file.".scripts".source                  = ./assets/.scripts;
}
