{ config, lib, pkgs, ... }:

{
    boot.loader.systemd-boot.enable        =  true;
    boot.loader.efi.canTouchEfiVariables   =  true;
    boot.kernelPackages                    =  pkgs.linuxPackages_latest;

    networking.hostName                    = "notebook";
    networking.networkmanager.enable       =  true;

    time.timeZone                          = "America/New_York";

    users.users.ankhi = {
        isNormalUser   = true;
        extraGroups    = [ "wheel" ];
        shell          = pkgs.zsh;
    };

    programs.zsh.enable = true;
}