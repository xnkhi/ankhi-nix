{ config, pkgs, ... }:

{
	home.file.".config/niri".source              = ./assets/.config/niri;
	home.file.".config/waybar".source            = ./assets/.config/waybar;
	home.file.".config/rofi".source              = ./assets/.config/rofi;
	home.file.".config/mako".source              = ./assets/.config/mako;
	home.file.".config/alacritty".source         = ./assets/.config/alacritty;
	home.file.".config/Kvantum".source           = ./assets/.config/Kvantum;
	#home.file.".config/nvim".source              = ./assets/.config/nvim;
	home.file.".config/fastfetch".source         = ./assets/.config/fastfetch;
	home.file.".config/wallpaper.png".source     = ./assets/.config/wallpaper.png;

	home.file.".scripts".source                  = ./assets/.scripts;
	home.file.".themes".source                   = ./assets/.themes;
	home.file.".icons".source                    = ./assets/.icons;
}