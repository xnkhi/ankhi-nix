{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages                  = pkgs.linuxPackages_latest;

  networking.hostName                  = "notebook";
  networking.networkmanager.enable     = true;

  time.timeZone = "America/New_York";

  users.users.ankhi = {
      isNormalUser = true;
      extraGroups  = [ "wheel" ];
      shell        = pkgs.zsh;
  };
  programs.zsh.enable = true;


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # desktop
    swaylock
    swayidle
    mako
    alacritty
    xfce.thunar
    rofi-wayland

    # basic utilities
    neovim
    btop
    wget
    curl
    tree
    p7zip
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
    niri.enable   = true;
    waybar.enable = true;
    steam.enable  = true;
  };

  services = {
    displayManager.sddm.enable         = true;
    displayManager.sddm.wayland.enable = true;
    gnome.gnome-keyring.enable         = true;
    printing.enable                    = true;
    pipewire.enable                    = true;
    pipewire.pulse.enable              = true;
    libinput.enable                    = true;
    supergfxd.enable                   = true;
    asusd.enable                       = true;
    asusd.enableUserService            = true;
  };

  security = {
    polkit.enable       = true;
    pam.services.swaylock = {};
  };
  



  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

}