{ config, pkgs, ... }:

{
	home.file.".config/niri".source            = ./assets/.config/niri;
	home.file.".config/waybar".source          = ./assets/.config/waybar;
	home.file.".config/rofi".source            = ./assets/.config/rofi;
	home.file.".config/mako".source            = ./assets/.config/mako;
	home.file.".config/alacritty".source       = ./assets/.config/alacritty;
	home.file.".config/wallpaper.png".source   = ./assets/.config/wallpaper.png;
	home.file.".chromium-extensions".source    = ./assets/chromium-extensions;
	home.file.".vscode-oss/extensions".source  = ./assets/vscodium-extensions;
}