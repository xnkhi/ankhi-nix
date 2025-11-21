{ config, lib, pkgs, ... }:

{

    # This is not the NixOS hardware configuration file.
    # This file is reserved for the installation and
    # configuration of software that interfaces closely
    # with your computer's hardware and peripherals.
    # Because hardware varies from computer to computer,
    # this configuration is written seperately.


    environment.systemPackages = with pkgs; [

        # Razer peripherals manager
        razergenie

        # RGB lighting configuration
        openrgb-with-all-plugins

        # Controller-to-keyboard remapper
        antimicrox

    ];


    services = {

        # GPU management for ROG laptops
        supergfxd.enable = true;
        asusd = {
            enable = true;
            enableUserService = true;
        };

        # peripheral input remapper
        input-remapper = {
            enable = true;
        };
        
    };
    
}
