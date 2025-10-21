{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules   = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules            = [ ];
  boot.kernelModules                   = [ "amdgpu" "kvm-amd" ];
  boot.extraModulePackages             = [ ];

  hardware.graphics = {
    enable      = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };


  fileSystems."/" = {
    device = "/dev/disk/by-uuid/02fd1853-d636-49c6-8b98-129f27041570";
    fsType = "ext4";
  };

  fileSystems."/boot" = { device = "/dev/disk/by-uuid/2A50-21EC";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/8d9f70df-cc7e-4224-9d07-58a2b890536c"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
