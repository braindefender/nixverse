{ ... }:

{
  networking.extraHosts = ''
    192.168.0.118   nexus
    172.16.255.255  hrdt.local
    172.16.255.255  gd.local
    172.20.13.62    test-api-tkt-bc.techlab.s7.ru

    smartlb31h01.group.s7 172.17.40.16
    smartdb31h01.group.s7 172.17.40.17
    smartdb24h02.group.s7 172.20.11.215
    smartlb24h01.group.s7 172.20.11.216
    172.20.53.20 sigma.s7.ru sigma-uat-2.s7.ru sigmak8s.s7.ru status.sigma.s7.ru

    172.20.11.216   balance-api-uat.s7.ru
    172.17.48.159   balance-api-uat.s7.ru

    172.21.132.136  sts-test02.s7.ru
    172.21.132.136  extended-login-test01.s7.ru
    172.20.11.216   smartchain-uat.s7.ru

    172.20.98.112   vsm-elk-uat.s7.ru
    172.20.98.123   vsm-elk-prod.s7.ru

    91.236.234.79   sftp.s7.aero

    172.23.16.9     qa-offer-service.web.s7.ru
    172.20.12.101   offer-service.web.s7.ru

    10.0.150.111    s7-twt-uat.ors-system.ru
    10.0.150.110    s7-twt-test.ors-system.ru
  '';

  networking.firewall.enable = false;

  virtualisation.docker.rootless.daemon.settings = {
    default-address-pools = [{ base = "10.200.0.0/16"; size = 24; }];
  };
}
