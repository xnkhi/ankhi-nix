{ config, lib, pkgs, ... }:

{
    services = {
        gnome.gnome-keyring.enable   = true;
        pcscd.enable                 = true;
        libinput.enable              = true;
    };

    # services.displayManager = {
    #     gdm.enable                   = true;
    # };

    services.pipewire = {
        enable                       = true;
        alsa.enable                  = true;
        alsa.support32Bit            = true;
        pulse.enable                 = true;
        jack.enable                  = true;
    };

    services.flatpak = {
        enable = true;
    };


    security = {
        polkit.enable                = true;
        pam.services.swaylock        = {  };
    };
}