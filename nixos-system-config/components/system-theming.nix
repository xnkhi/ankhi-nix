{ config, lib, pkgs, ... }:

{
    catppuccin = {

        enable                =  true;

        accent                = "pink";
        flavor                = "mocha";

        tty.enable            =  true;
        tty.flavor            = "mocha";

        sddm.enable           =  true;
        sddm.accent           = "pink";
        sddm.flavor           = "mocha";
        sddm.clockEnabled     =  true;
        sddm.assertQt6Sddm   =  true;
        sddm.background       =  ./assets/sddmwallpaper.png;

    };
}