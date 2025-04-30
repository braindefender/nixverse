{
  services.xserver.xkb = {
    # Doesn't work for the first time?
    layout = "ULO";

    extraLayouts = {
      ULO = {
        description = "UL Ortho";
        symbolsFile = ./ul-ortho;
        languages = [ "eng" "rus" ];
      };
    };
  };
}
