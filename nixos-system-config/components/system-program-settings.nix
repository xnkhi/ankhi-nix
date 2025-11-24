{ config, lib, pkgs, ... }:

{

    programs.appimage = {
        binfmt = true; 
    };

    programs.gnupg.agent = {
       enable = true;
    };

    programs.steam = {
        enable = true;
        remotePlay.openFirewall                  = true;
        dedicatedServer.openFirewall             = true;
        localNetworkGameTransfers.openFirewall   = true;
    };

}
