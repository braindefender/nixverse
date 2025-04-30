{ pkgs, ... }: {
  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    defaultCommand = "${pkgs.fd} --type f --strip-cwd-prefix";

    defaultOptions = [
      "--border"
      "--prompt 'λ '"
      "--pointer ''"
      "--marker ''"
    ];
  };
}
