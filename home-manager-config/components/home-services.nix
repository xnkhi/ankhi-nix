{ config, pkgs, ... }:

{
    systemd.user.services = {

		swaybg = {
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

	};
}