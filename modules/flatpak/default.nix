{ ... }: {
  imports = [
    ./telegram.nix
  ];

  services.flatpak = {
    enable = true;

    update.onActivation = false;
  };
}
