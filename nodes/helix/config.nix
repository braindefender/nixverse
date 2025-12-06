{ pkgs, ... }:

{
  # Note: modules come from `modules/nixos` directory
  imports = [
    ./hardware.nix
    ./partitions.nix
    ./virtualization.nix

    ../../modules/nixos/system
    ../../modules/nixos/visuals
    ../../modules/nixos/universal-layout
    ../../modules/nixos/boot-grub.nix
    ../../modules/nixos/display-manager.nix
    # ../../modules/nixos/desktop-gnome.nix

    ../../modules/nixos/apps/apps.nix
    ../../modules/nixos/devtools.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/work-te.nix

    ../../modules/nixos/services/copyparty.nix
    # ../../modules/nixos/services/kanata.nix
    ../../modules/nixos/services/samba.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config = { allowBroken = true; allowUnfree = true; };
  networking.hostName = "helix";

  programs.zsh.enable = true;

  users.users = {
    brain = {
      isNormalUser = true;
      initialPassword = "nixos";
      home = "/home/brain";
      shell = pkgs.zsh;
      uid = 1000;
      group = "users";

      extraGroups = [
        "wheel"
        "video"
        "audio"
        "networkmanager"
        "docker"
        "libvirtd"
      ];
    };
  };
}
