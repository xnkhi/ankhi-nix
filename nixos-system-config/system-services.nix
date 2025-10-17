{ config, lib, pkgs, ... }:

{
    services = {
        displayManager.sddm.enable           = true;
        displayManager.sddm.wayland.enable   = true;
        displayManager.sddm.package          = pkgs.kdePackages.sddm; # 😭
        gnome.gnome-keyring.enable           = true;
        printing.enable                      = true;
        pipewire.enable                      = true;
        pipewire.pulse.enable                = true;
        libinput.enable                      = true;
        supergfxd.enable                     = true;
        asusd.enable                         = true;
        asusd.enableUserService              = true;
    };

    security = {
        polkit.enable                        = true;
        pam.services.swaylock                = {  };
    };
}