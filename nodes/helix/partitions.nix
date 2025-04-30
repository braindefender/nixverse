{ ... }:

{
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

    "/" = {
      device = "vpool/root";
      fsType = "zfs";
    };

    "/nix" = {
      device = "vpool/nix";
      fsType = "zfs";
    };

    "/home" = {
      device = "vpool/home";
      fsType = "zfs";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/SWAP"; }
  ];
}
