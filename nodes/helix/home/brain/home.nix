{ osConfig, modules', ... }:

{
  imports = [
    modules'.shell
  ];

  home.stateVersion = osConfig.system.stateVersion;
}
