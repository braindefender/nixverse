{ ... }:

{
  # Enable 'uinput' module that is needed for Kanata to work
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  users.groups.uinput = { };

  systemd.services.kanata-universalLayout.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;

    keyboards = {
      universalLayout = {
        configFile = ./universal-layout.kbd;
      };
    };
  };
}
