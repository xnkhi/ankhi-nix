{ config, lib, pkgs, ... }:

{

    # I switch between niri and gnome.
    # gnome sometimes because niri isn't very mature.
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
            #gnome-terminal
            #gnome-tweaks
        ];
        #gnome.excludePackages = with pkgs; [
        #    gnome-tour
        #    gnome-user-docs
        #];
    };

    programs = {
        niri.enable = true;
        waybar.enable = true;
    };

    #programs.dconf.profiles.user.databases = [
    #    {
    #        settings = {
    #            "org/gnome/mutter" = {
    #                experimental-features = [
    #                    "scale-monitor-framebuffer"
    #                    "xwayland-native-scaling"
    #                ];
    #            };
    #        };
    #    }
    #];

    services = {
        displayManager.ly.enable = true;
        #desktopManager.gnome.enable = true;
        #gnome = {
        #    core-apps.enable = false;
        #    core-developer-tools.enable = false;
        #    games.enable = false;
        #};
        #pam.services.swaylock        = {  };
    };

}
