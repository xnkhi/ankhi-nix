{ config, pkgs, ... }:

{
	home.file.".config/niri".source            = .home-dir-files/config/niri;
	home.file.".config/waybar".source          = .home-dir-files/config/waybar;
	home.file.".config/rofi".source            = .home-dir-files/config/rofi;
	home.file.".config/mako".source            = .home-dir-files/config/mako;
	home.file.".config/alacritty".source       = .home-dir-files/config/alacritty;
	home.file.".config/wallpaper.png".source   = .home-dir-files/config/wallpaper.png;
	home.file.".chromium-extensions".source    = .home-dir-files/misc/chromium-extensions;