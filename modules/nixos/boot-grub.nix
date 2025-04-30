{ config, lib, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = false;
      configurationLimit = 10;
    };

    timeout = 2;

    efi.canTouchEfiVariables = true;
  };
}
