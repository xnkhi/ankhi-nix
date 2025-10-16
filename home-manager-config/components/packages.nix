{ config, pkgs, ... }:

{
    home.packages = with pkgs; [

		catppuccin-cursors.mochaPink
		
	];
}