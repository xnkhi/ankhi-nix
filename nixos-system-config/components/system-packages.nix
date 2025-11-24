{ config, lib, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        
        # hardware
            pulseaudio
            pavucontrol

        # system
            iptables
            gnome-keyring

        # desktop
            # I use a fork of the niri window manager that implements blur.
            # See assets/niri-blur-bin for compiled binaries
            # See system-niri.nix for niri installation
            swayosd
            swaylock
            swayidle
            mako
            alacritty
            xfce.thunar
            nautilus
            rofi
            xwayland-satellite

        # basic utilities
            btop
            tree
            wget
            curl
            nmap
            p7zip-rar
            imagemagick

        # development (languages)
            nasm
            gcc
            rustc
            cargo
            go
            lua
            python314

        # development (editor - vscodium & nvim)
            vscodium
            neovim
            fd
            fzf
            ripgrep
            vimPlugins.nvim-treesitter

        # internet
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
            wireshark
            burpsuite
            ghidra-bin
            virt-manager
            cryptomator
            keepassxc
            kdePackages.kleopatra
            feather
            vesktop

        # games
            melonDS
            dolphin-emu
            cemu

        # misc
            fastfetch
            lact
            wineWowPackages.stable
            winetricks

    ];

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        ubuntu-sans
        ubuntu-sans-mono
    ];

    programs = {
        zsh.enable        = true;
        niri.enable       = true;
        waybar.enable     = true;
        java.enable       = true;
        appimage.enable   = true;
    };
    
    virtualisation.waydroid = {
        enable = true;
    };

}
