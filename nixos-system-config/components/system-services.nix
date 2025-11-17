{ config, lib, pkgs, ... }:

{
    services = {
        gnome.gnome-keyring.enable   = true;
        pcscd.enable                 = true;
        printing.enable              = true;
        libinput.enable              = true;
        supergfxd.enable             = true;
        asusd.enable                 = true;
        asusd.enableUserService      = true;
    };

    services.displayManager = {
        sddm.enable                  = true;
        sddm.wayland.enable          = true;
        sddm.package                 = pkgs.kdePackages.sddm;
    };

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