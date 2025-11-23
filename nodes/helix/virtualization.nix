{ pkgs, lib, ... }:

let
  gpuIds = [
    "10de:2216" # NVidia RTX 3080 / Video
    "10de:1aef" # NVidia RTX 3080 / Audio
  ];
in

{
  boot = {
    kernelModules = [
      "kvm-intel"
      "vfio_virqfd"
      "vfio_pci"
      "vfio_iommu_type1"
      "vfio"
    ];

    blacklistedKernelModules = [ "nvidia" "nouveau" "xpad" ];

    kernel.sysctl = {
      "vm.nr_hugepages" = 16;
      "kernel.shmmax" = 17179869184;
      "vm.hugetlb_shm_group" = 302;
    };

    kernelParams = [
      "intel_iommu=on"
      "preempt=voluntary"
      "default_hugepages_size=1G"
      "hugepages=16"
      "hugepages_size=1G"
    ];

    extraModprobeConfig = "options vfio-pci ids=" + lib.concatStringsSep "," gpuIds;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    lm_sensors
    libhugetlbfs
  ];
}
