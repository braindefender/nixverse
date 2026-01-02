{ pkgs, ... }:

let
  aliases = {
    q = "exit";
    c = "clear";
    v = "nvim";
    dust = "${pkgs.dust}/bin/dust -X .git -X node_modules";
    grep = "${pkgs.gnugrep}/bin/grep --color='always'";

    # Git
    g = "git";
    gs = "git status";
    push = "git push";
    pull = "git pull";
    fetch = "git fetch";
    commit = "git commit -a -m";

    lg = "${pkgs.lazygit}/bin/lazygit";
    lf = "${pkgs.joshuto}/bin/joshuto";
    spf = "${pkgs.superfile}/bin/superfile";

    # NixOS
    cleanup = "sudo nix-collect-garbage --delete-older-than 7d";
    bloat = "nix path-info -Sh /run/current-system";
    nrs = "sudo nixos-rebuild switch --flake .#helix";

    # ZFS
    zlist = "sudo zfs list | grep --invert-match 'vpool/root/'";
    zsnap = "sudo zfs list -t snapshot | grep --invert-match 'vpool/root/'";
  };
in

{
  home.shellAliases = aliases;
}
