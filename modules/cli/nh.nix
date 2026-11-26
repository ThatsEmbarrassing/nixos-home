{ config, ... }: {
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 7d";
    };
  };

  home.sessionVariables = {
    NH_HOME_FLAKE = "${config.home.homeDirectory}/.config/home-manager";
  };
}
