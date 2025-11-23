{ pkgs, ... }:

let
  users = [ "root" "brain" ];
in

{
  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    nil
    nixd # nix language server
    nix-tree # tree-like nix store exploration
    nix-index
    nixpkgs-fmt
    comma
  ];

  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
  };

  nix = {
    settings = {
      cores = 4;
      experimental-features = [ "nix-command" "flakes" ];
      http-connections = 50;
      warn-dirty = false;
      log-lines = 50;
      sandbox = "relaxed";
      auto-optimise-store = true;
      trusted-users = users;
      allowed-users = users;

      substituters = [
        "https://aseipp-nix-cache.global.ssl.fastly.net"
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
