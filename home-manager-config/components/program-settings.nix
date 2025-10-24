{ config, pkgs, ... }:

{

	programs.zsh = {
		history.size = 100;
		initContent  = ''
			autoload -Uz colors && colors
			PS1="[%F{magenta}%n%f.%F{black}%m%f] %F{blue}%~%f \ "
		'';
		initExtra = ''
			bindkey "''${key[Up]}" up-line-or-search
		'';
		shellAliases = {
			la      = "ls -a";
			ll      = "ls -l";
			cls     = "clear";
			v       = "nvim";
			sysup   = "sudo nixos-rebuild switch --flake ~/.system-dotfiles#notebook";
		};
	};

	programs.zsh.oh-my-zsh = {
		plugins = [
			"zsh-autosuggestions"
			"zsh-syntax-highlighting"
		];
	};

	programs.git = {
		userName    = "xnkhi";
		userEmail   = "git.chokehold749@passinbox.com";
	};

}