{ modules', ... }:

{
  imports = [
    ./hardware.nix
    ./partitions.nix
    ./virtualization.nix

    modules'.universal-layout
    modules'.devtools
    modules'.work-te
  ];

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
