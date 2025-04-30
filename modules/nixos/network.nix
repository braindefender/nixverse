{ pkgs, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  networking.firewall.enable = false;
  networking.networkmanager.enable = true;
  networking.networkmanager.enableStrongSwan = true;

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanager-l2tp
    networkmanager-openvpn
    networkmanager_strongswan
    networkmanagerapplet
  ];

  # L2TP VPN
  services.strongswan = {
    enable = true;
    secrets = [ "ipsec.d/ipsec.nm-l2tp.secrets" ];
  };

}
