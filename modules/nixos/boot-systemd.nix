{ ... }:

# not used

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false; # for security reasons
      configurationLimit = 10;
    };

    timeout = 2;

    efi.canTouchEfiVariables = true;
  };
}
