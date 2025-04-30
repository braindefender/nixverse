{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  programs.git = {
    enable = true;

    package = pkgs.gitFull;

    userName = "Nikita Shirokov";
    userEmail = "braindefender@gmail.com";

    ignores = [ "*~" "*.swp" ];

    extraConfig = {
      init.defaultBranch = "master";
      pull.rebase = true;
      push.autoSetupRemote = true;
      credential.helper = "libsecret";
    };
  };
}
