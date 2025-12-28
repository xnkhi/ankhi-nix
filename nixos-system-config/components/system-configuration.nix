{ config, lib, pkgs, ... }:

{

    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables  = true;
        };
        kernelPackages = pkgs.linuxPackages_zen;
    };

    networking = {
        hostName                = "notebook";
        networkmanager.enable   = true;
        nftables.enable         = true;
    };

    time.timeZone = "America/New_York";

    users.users.ankhi = {
        isNormalUser   = true;
        extraGroups    = [ "wheel" "user-with-access-to-virtualbox" ];
        shell          = pkgs.zsh;
    };

    users.groups = {
        libvirtd.members = [ "ankhi" ];
    };

    virtualisation = {
    	libvirtd.enable = true;
	    spiceUSBRedirection.enable = true;
        waydroid.enable = true;
    };
    
}
