{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gnupg ];
  services.gnome.gnome-keyring.enable = true;
}
