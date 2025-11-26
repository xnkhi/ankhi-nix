{ config, lib, pkgs, ... }:

{

    # I like niri and gnome.
    # Currently using gnome until niri is more mature.
    # Niri also isn't the greatest for gaming.
    # I would use hyprland if vaxry wasn't a hateful capitalist piece of shit.

    # Note: some desktop configuration is done via home-manager.
    #  See home-manager-config/components/home-desktop.nix

    environment = {
        systemPackages = with pkgs; [
            swayosd
            swaylock
            swayidle
            mako
            alacritty
            xfce.thunar
            nautilus
            rofi
            xwayland-satellite
        ];
        gnome.excludePackages = with pkgs; [
            gnome-tour
            gnome-user-docs
        ];
    };

    programs = {
        niri.enable = true;
        waybar.enable = true;
    };

    services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        gnome = {
            core-apps.enable = false;
            core-developer-tools.enable = false;
            games.enable = false;
        };
    };

}
