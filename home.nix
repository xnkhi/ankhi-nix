{ config, pkgs, ... }:
{
	home.username = "ankhi";
	home.homeDirectory = "/home/ankhi";
	home.stateVersion = "25.05";

	fonts.fontconfig.enable = true;

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

	programs.git.enable          = true;
	programs.git.userName        = "xnkhi";
	programs.git.userEmail       = "git.chokehold749@passinbox.com";

	systemd.user.services.swaybg = {
		Unit = {
			Description = "swaybg background image service";
			PartOf = [ "graphical-session.target" ];
		};
		Service = {
			ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${config.home.homeDirectory}/.config/wallpaper.png --mode fill";
			Restart = "always";
		};
		Install = {
			WantedBy = [ "graphical-session.target" ];
		};
	};

	
	home.packages = with pkgs; [
		catppuccin-cursors.mochaPink
	];


	home.file.".config/alacritty".source=./config/alacritty;
	home.file.".config/mako".source=./config/mako;
	home.file.".config/niri".source=./config/niri;
	home.file.".config/rofi".source=./config/rofi;
	home.file.".config/waybar".source=./config/waybar;
	home.file.".config/wallpaper.png".source=./config/wallpaper.png;
	home.file.".chromium-extensions".source=./files/chromium-extensions;
}