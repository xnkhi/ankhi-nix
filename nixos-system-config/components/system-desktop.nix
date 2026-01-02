{ config, lib, pkgs, aerothemeplasma, ... }:

let
	aero = pkgs.callPackage aerothemeplasma { };
in
{
	services = {
		desktopManager.plasma6.enable = true;
		displayManager.sddm.enable = true;
		displayManager.sddm.wayland.enable = true;
	};

	environment.systemPackages = [
		pkgs.kdePackages.kcalc
		pkgs.kdePackages.kcharselect
		pkgs.kdePackages.kclock
		pkgs.kdePackages.kcolorchooser
		pkgs.kdePackages.kolourpaint
		pkgs.kdePackages.ksystemlog
		pkgs.kdePackages.sddm-kcm
		pkgs.kdePackages.isoimagewriter
		pkgs.kdePackages.partitionmanager
		pkgs.kdePackages.qtstyleplugin-kvantum
		pkgs.hardinfo2
		pkgs.vlc
		pkgs.wayland-utils
		pkgs.wl-clipboard

		aero.aeroglassblur
    	aero.aeroglide
    	aero.decoration
    	aero.kcmloader
    	aero.login-sessions
    	aero.smodglow
    	aero.smodsnap-v2
    	aero.startupfeedback
    	aero.sevenstart
    	aero.seventasks
    	aero.systemtray
    	aero.volume
    	aero.notifications
    	aero.extra
	];

	xdg = {
		portal.enable = true;
	};

}
