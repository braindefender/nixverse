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
        ul-orhto-eng = {
          description = "UL Ortho EN";
          symbolsFile = ./ul-ortho-eng.xkb;
          languages = [ "eng" ];
        };
        ul-orhto-rus = {
          description = "UL Ortho RU";
          symbolsFile = ./ul-ortho-rus.xkb;
          languages = [ "rus" ];
        };
        ul-ortho-combo = {
          description = "UL Ortho";
          symbolsFile = ./ul-ortho-combo.xkb;
          languages = [ "eng" "rus" ];
        };
      };

    };
  };

}
