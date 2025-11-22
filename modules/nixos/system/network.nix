{ pkgs, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  networking.firewall.enable = false;
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-strongswan
      networkmanager-l2tp
      networkmanager-openvpn
    ];
  };

  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
  ];

  # L2TP VPN
  services.strongswan = {
    enable = true;
    secrets = [ "ipsec.d/ipsec.nm-l2tp.secrets" ];
  };
}
