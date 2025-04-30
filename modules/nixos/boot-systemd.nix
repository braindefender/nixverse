{ config, ... }:

# not used

{
  config = mkIf cfg.enable {
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false; # for security reasons
        configurationLimit = 10;
      };

      timeout = 2;

      efi.canTouchEfiVariables = true;
    };
  };
}
