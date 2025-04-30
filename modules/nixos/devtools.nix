{ pkgs, ... }:

{
  virtualisation.docker = {
    # root docker is turned off, use rootless docker
    # enable = true;
    storageDriver = "zfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # C/C++
    clang
    clang-tools
    cmake
    # Rust
    rust-analyzer
    rustfmt
    cargo
    # Others
    go
    lldb
    docker-compose
    # Web
    nodejs
    bun
    emmet-language-server
    turso-cli
    tokei
  ] ++ (with pkgs.nodePackages_latest; [
    prettier
    typescript-language-server
    yarn
    pnpm
  ]);
}
