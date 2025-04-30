{ modules', ... }:

{
  imports = [
    modules'.system
    modules'.devtools
    modules'.boot-grub
    modules'.packages
    modules'.work-te
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
