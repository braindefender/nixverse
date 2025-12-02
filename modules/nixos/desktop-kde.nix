{ ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    desktopManager.cosmic.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };
}
