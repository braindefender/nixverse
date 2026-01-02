{ pkgs, ... }:

let
  app = pkgs.writeShellScript "vivaldi-teams" ''
    vivaldi --app=https://teams.microsoft.com/v2/
  '';
  nirius = ''nirius focus-or-spawn --app-id="^vivaldi-teams"'';
in

{
  xdg.desktopEntries = {
    teams = {
      name = "Teams";
      genericName = "Video Conferencing, Meetings, Calling";
      exec = "${nirius} ${app}";
      terminal = false;
      categories = [
        "Network"
        "InstantMessaging"
      ];
      icon = ./icons/Microsoft_Teams.svg;
    };

    vivaldi-vpn = {
      name = "Vivaldi (VPN)";
      genericName = "Web Browser";
      exec = ''vivaldi --proxy-server="socks5://127.0.0.1:2080"'';
      terminal = false;
      type = "Application";
      categories = [ "Network" ];
      icon = "vivaldi";
    };

    virt-manager = {
      name = "Virt Manager";
      genericName = "Virtual machine viewer/manager";
      exec = "virt-manager";
      type = "Application";
      terminal = false;
      categories = [ "System" ];
      icon = ./icons/virt-manager_128.png;
      settings = {
        Keywords = "virt;vm;vmm;libvirt;qemu;kvm";
        StartupWMClass = ".virt-manager-wrapped";
      };
    };
  };
}
