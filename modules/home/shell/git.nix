{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  programs.git = {
    enable = true;

    package = pkgs.gitFull;

    settings = {
      user = {
        name = "Nikita Shirokov";
        email = "braindefender@gmail.com";
      };
      init.defaultBranch = "master";
      pull.rebase = true;
      push.autoSetupRemote = true;
      credential.helper = "libsecret";
    };

    ignores = [ "*~" "*.swp" ".DS_Store" "._.DS_Store" ];
  };
}
