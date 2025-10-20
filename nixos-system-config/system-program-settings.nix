{ config, lib, pkgs, ... }:

{

    programs.appimage = {
        binfmt = true; 
    };

    programs.steam = {
        enable = true;
        remotePlay.openFirewall                  = true;
        dedicatedServer.openFirewall             = true;
        localNetworkGameTransfers.openFirewall   = true;
        package = pkgs.steam.override {
            withPrimus = true;
        };
    };

}