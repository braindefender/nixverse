{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xkbcomp
    xorg.setxkbmap
  ];

  services.xserver = {
    enable = true;
    exportConfiguration = lib.mkForce true;

    xkb = {
      # Doesn't work for the first time?
      #   layout = "ulo";

      extraLayouts = {
        ul-ortho-combo = {
          description = "UL Ortho";
          symbolsFile = ./ul-ortho-combo.xkb;
          languages = [ "eng" "rus" ];
        };
      };

    };
  };

}
