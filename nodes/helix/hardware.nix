{ pkgs, ... }:

{
  # 64-Bit system target
  nixpkgs.hostPlatform = "x86_64-linux";

  # Needed for ZFS configuration // https://search.nixos.org/options?channel=unstable&show=networking.hostId
  networking.hostId = "b27a47ea";

  boot = {
    # Before boot
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
    };
  };

  # Intel CPU & Video
  powerManagement.cpuFreqGovernor = "performance";

  boot.initrd.kernelModules = [ "i915" ];
  boot.kernelParams = [
    "i915.modeset=1"
    "i915.enable_guc=2"
    "i915.force_probe=a780"
  ];

  services.xserver.videoDrivers = [ "intel" ];

  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      extraPackages = with pkgs;[
        vaapiVdpau
        libvdpau-va-gl
        intel-media-driver
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    linux-firmware
    libva-utils
    glibc
    mesa
  ];
}
