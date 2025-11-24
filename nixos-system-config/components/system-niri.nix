{ config, pkgs, lib, ... }:

let
    niriBlurBin = pkgs.runCommand "niri-blur-bin" { } ''
        mkdir -p $out
        cp -r ${./assets/niri-blur-bin}/bin $out/
        cp -r ${./assets/niri-blur-bin}/share $out/
    '';
in
{

    environment.systemPackages = [
        niriBlurBin
    ];

    environment.etc."wayland-sessions/niri.desktop".source = "${niriBlurBin}/share/wayland-sessions/niri.desktop";

    environment.etc."xdg-desktop-portal/niri-portals.conf".source = "${niriBlurBin}/share/xdg-desktop-portal/niri-portals.conf";

    systemd.user.services.niri = {
        description = "Niri compositor";
        serviceConfig = {
            ExecStart = "${niriBlurBin}/bin/niri";
        };
        wantedBy = [ "graphical-session.target" ];
    };

    systemd.user.targets."niri-shutdown" = {
        unitConfig = {
            Description = "Shutdown target for Niri";
        };
    };

}
