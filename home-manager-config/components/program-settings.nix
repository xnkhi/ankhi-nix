{ config, pkgs, ... }:

{

	programs.zsh = {
		history.size = 100;
		initContent  = ''
			autoload -Uz colors && colors
			PS1="[%F{magenta}%n%f.%F{black}%m%f] %F{blue}%~%f > "
		'';
		shellAliases = {
			la      = "ls -a";
			ll      = "ls -l";
			cls     = "clear";
			v       = "nvim";
			sysup   = "sudo nixos-rebuild switch --flake ~/.system-dotfiles#notebook";
		};
	};

	programs.zsh.zplug = {
		plugins = [
			{ name = "zsh-users/zsh-autosuggestions"; }
			{ name = "zsh-users/zsh-syntax-highlighting"; }
		];
	};

	programs.git = {
		userName    = "xnkhi";
		userEmail   = "git.chokehold749@passinbox.com";
	};

}