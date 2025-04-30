{ pkgs, ... }:

{
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
