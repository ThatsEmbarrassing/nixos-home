{ inputs, pkgs, ... }: {
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager

    ./config.nix
  ];

  home.packages = [
    pkgs.cosmic-ext-applet-minimon
  ];
}
