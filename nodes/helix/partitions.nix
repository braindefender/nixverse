{ pkgs, ... }:

# Note: other ZFS datasets are mounted by ZFS itself.

{
  # Note: manually set ZFS package to "zfs_unstable"
  #       because old one comes with outdated core.
  boot.zfs.package = pkgs.zfs_unstable;
  boot.extraModprobeConfig = "options zfs zfs_dirty_data_max=67108864";

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
