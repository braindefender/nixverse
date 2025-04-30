{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ dbeaver ];
  # TODO: add hosts with SOPS secrets
}
