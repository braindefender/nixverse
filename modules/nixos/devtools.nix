{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # - Common
    just
    tokei
    devenv

    # - Database
    dbeaver-bin
    turso-cli

    # - C/C++
    clang
    clang-tools
    cmake

    # - Rust
    rust-analyzer
    rustfmt
    cargo

    # - Others
    go
    lldb
    docker-compose

    # - Web
    nodejs
    bun
    emmet-language-server
    nodePackages_latest.yarn
    nodePackages_latest.pnpm
    nodePackages_latest.prettier
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
  ];

  virtualisation.docker = {
    # root docker is turned off, use rootless docker
    # enable = true;
    storageDriver = "zfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  services.vscode-server.enable = true;
  programs.nix-ld.enable = true;
}
