{ config, pkgs, ... }:
{
	home.username = "ankhi";
	home.homeDirectory = "/home/ankhi";
	home.stateVersion = "25.05";

	programs.bash = {
		enable = true;
		shellAliases = {
			la = "ls -a";
			ll = "ls -l";
			rebuild-dots = "sudo nixos-rebuild switch --flake ~/.system-dotfiles#notebook";
		};
	};
	
	programs.git.enable = true;
	programs.git.userName = "xnkhi";
	programs.git.userEmail = "git.chokehold749@passinbox.com";

	programs.alacritty.enable = true;
	programs.rofi.enable = true;
	programs.rofi.package = pkgs.rofi-wayland;
	programs.swaylock.enable = true;
	programs.waybar.enable = true;

	services.mako.enable = true;
	services.swayidle.enable = true;
	services.polkit-gnome.enable = true;

	home.packages = with pkgs; [
		niri
		xfce.thunar
		swaybg
		alacritty
	];

	home.file.".config/alacritty".source=./config/alacritty;
	# home.file.".config/fontconfig".source=./config/fontconfig;
	home.file.".config/mako".source=./config/mako;
	home.file.".config/niri".source=./config/niri;
	home.file.".config/rofi".source=./config/rofi;
	home.file.".config/waybar".source=./config/waybar;
	home.file.".config/wallpaper.png".source=./config/wallpaper.png;
}


