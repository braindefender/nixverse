{
  imports = [
    ./boot-grub.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  services.openssh.enable = true;
}
