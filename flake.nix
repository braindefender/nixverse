{
  description = "Modular Nix Flake Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # VSCode Remote SSH Server
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    # GRUB 2 Themes
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    # Copyparty File Sharing
    copyparty.url = "github:9001/copyparty";
    # Niri Window Manager
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs @ { nixpkgs
    , home-manager
    , vscode-server
    , grub2-themes
    , copyparty
    , niri-flake
    , ...
    }: {
      nixosConfigurations.helix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # NixOS Modules
          home-manager.nixosModules.home-manager
          vscode-server.nixosModules.default
          grub2-themes.nixosModules.default
          copyparty.nixosModules.default
          # Overlays
          {
            nixpkgs.overlays = [
              copyparty.overlays.default
              niri-flake.overlays.niri
            ];
          }
          # Host Modules
          ./nodes/helix/config.nix
          # Home Manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.brain = {
              imports = [
                niri-flake.homeModules.niri
                ./homes/brain/home.nix
              ];
            };
          }
        ];

      };
    };
}
