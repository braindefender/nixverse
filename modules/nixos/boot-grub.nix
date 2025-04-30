{ ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = false;
      configurationLimit = 10;
    };

    # grub2-theme = {
    #   enable = true;
    #   theme = "stylish";
    #   footer = true;
    #   customResolution = "3440x1440";
    # };

    timeout = 2;

    efi.canTouchEfiVariables = true;
  };
}
