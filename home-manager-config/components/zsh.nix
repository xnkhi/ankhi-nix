{ config, pkgs, ... }:

{
    programs.zsh.enable = true;
	programs.zsh.history.size = 100;
	programs.zsh.shellAliases = {
		la = "ls -a";
		ll = "ls -l";
		"?" = "niri-session";
		sysup = "sudo nixos-rebuild switch --flake ~/.system-dotfiles#notebook";
	};
	
	programs.zsh.zplug.enable = true;
	programs.zsh.zplug.plugins = [
		{ name = "zsh-users/zsh-autosuggestions"; }
		{ name = "zsh-users/zsh-syntax-highlighting"; }
	];

	programs.zsh.initContent = ''
		autoload -Uz colors && colors
		PS1="[%F{magenta}%n%f.%F{black}%m%f] %F{blue}%~%f > "
	'';
}