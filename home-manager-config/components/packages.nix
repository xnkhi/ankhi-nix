{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
		
	];

    programs = {
        git.enable             = true;
        zsh.enable             = true;
        zsh.oh-my-zsh.enable   = true;
    };
}