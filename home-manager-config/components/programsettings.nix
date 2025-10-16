{ config, pkgs, ... }:

{
	programs.git = {
		enable      = true;
		userName    = "xnkhi";
		userEmail   = "git.chokehold749@passinbox.com";
	};
}