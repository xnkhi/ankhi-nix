{ config, lib, pkgs, ... }:

{
    system.stateVersion = "25.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./hardware-configuration.nix
        ./components/system-configuration.nix
        ./components/system-packages.nix
        ./components/system-services.nix
        ./components/system-program-settings.nix
        ./components/system-hardware.nix
        ./components/system-theming.nix
    ];

}
