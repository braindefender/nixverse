{ modules', ... }:

{
  imports = [
    ./hardware.nix
    ./virtualization.nix

    modules'.bluetooth
    modules'.boot-grub
    modules'.config
    modules'.locale
    modules'.network
    modules'.nix
    modules'.security
    modules'.sound

    modules'.universal-layout
    modules'.devtools
    modules'.work-te
  ];
}
