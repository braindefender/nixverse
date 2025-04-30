{ ... }:

{
  programs.eza = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    git = true;
    icons = "always";
    colors = "always";

    extraOptions = [
      "--group-directories-first"
      "--time-style=long-iso"
    ];
  };
}
