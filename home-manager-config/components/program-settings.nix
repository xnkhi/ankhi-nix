{ config, pkgs, ... }:

{

	programs.zsh = {
		enable       = true;
		history.size = 100;
		initContent  = ''
			autoload -Uz colors && colors
			PS1="[%F{magenta}%n%f.%F{black}%m%f] %F{blue}%~%f > "
		'';
		shellAliases = {
			la      = "ls -a";
			ll      = "ls -l";
			sysup   = "sudo nixos-rebuild switch --flake ~/.system-dotfiles#notebook";
		};
	};

	programs.zsh.zplug = {
		enable = true;
		plugins = [
			{ name = "zsh-users/zsh-autosuggestions"; }
			{ name = "zsh-users/zsh-syntax-highlighting"; }
		];
	};

	programs.git = {
		enable      = true;
		userName    = "xnkhi";
		userEmail   = "git.chokehold749@passinbox.com";
	};

}