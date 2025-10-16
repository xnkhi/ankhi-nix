{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "notebook";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  services.displayManager.sddm.enable         = true;
  services.displayManager.sddm.wayland.enable = true;
  services.printing.enable                    = true;
  services.pipewire.enable                    = true;
  services.pipewire.pulse.enable              = true;
  services.libinput.enable                    = true;
  services.supergfxd.enable                   = true;
  services.asusd.enable                       = true;
  services.asusd.enableUserService = true;

  users.users.ankhi = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
  };
  programs.zsh.enable = true;


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

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


  programs.steam.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ubuntu-sans
    ubuntu-sans-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

}