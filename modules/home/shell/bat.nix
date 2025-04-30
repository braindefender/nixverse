{ pkgs, ... }:

let
  aliases = { cat = "bat -p"; };
in

{
  programs = {
    bat = {
      enable = true;

      extraPackages = with pkgs.bat-extras; [ batman batgrep ];
    };

  };

  home.shellAliases = aliases;
}
