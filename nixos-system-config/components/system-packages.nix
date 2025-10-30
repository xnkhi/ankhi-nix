{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [

        # desktop
            swaylock
            swayidle
            mako
            alacritty
            xfce.thunar
	        nautilus
            rofi-wayland
            xwayland-satellite
            papirus-icon-theme
            catppuccin-papirus-folders

        # basic utilities
            neovim
            btop
            wget
            curl
            tree
            p7zip-rar
            imagemagick
            nmap

        # languages
            nasm
            gcc
            rustc
            go
            lua
            python314

        # internet
            ungoogled-chromium
            firefox
            tor
            tor-browser
            openvpn
            proxychains
            qbittorrent
            filezilla

        # applications
            mpv
            obs-studio
            gimp3
            inkscape
            davinci-resolve
            vscodium
            wireshark
            burpsuite
            ghidra-bin
            virt-manager
            cryptomator
            keepassxc
            feather
            vesktop

        # games
            antimicrox
            melonDS
            dolphin-emu
            cemu

        # other
            fastfetch
            gnome-keyring
            openrgb-with-all-plugins
            pulseaudio
            pavucontrol
            wineWowPackages.stable
            winetricks

    ];

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        ubuntu-sans
        ubuntu-sans-mono
    ];

    programs = {
        niri.enable       = true;
        waybar.enable     = true;
        java.enable       = true;
        appimage.enable   = true;
    };

}
