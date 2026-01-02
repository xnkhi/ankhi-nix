{ config, lib, pkgs, aerothemeplasma, ... }:

let
    aero = aerothemeplasma.packages.${pkgs.system};
in
{
    environment.systemPackages = (with aero; [
        aeroglassblur
        aeroglide
        decoration
        kcmloader
        login-sessions
        smodglow
        smodsnap-v2
        startupfeedback
        sevenstart
        seventasks
        systemtray
        volume
        notifications
        extra
    ]) ++ [
        pkgs.kdePackages.qtstyleplugin-kvantum
    ];
}
