{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
		
	];

    programs = {
        git.enable             = true;
        zsh.enable             = true;
    };
}