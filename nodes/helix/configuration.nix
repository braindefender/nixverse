{ modules', ... }:

{
  imports = [
    ./hardware.nix
    ./partitions.nix
    ./virtualization.nix

    modules'.system
    modules'.boot-grub
    modules'.packages
    modules'.universal-layout
    modules'.devtools
    modules'.work-te
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  users.users = {
    brain = {
      isNormalUser = true;
      home = "/home/brain";
      uid = 1000;

      extraGroups = [
        "wheel"
        "video"
        "audio"
        "networkmanager"
        "docker"
      ];
    };
  };
}
