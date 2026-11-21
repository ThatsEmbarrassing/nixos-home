{ ... }: {
  imports = [
    ./apps
    ./cli
    ./cosmic
    ./services
    ./flatpak

    ./packages.nix
    ./session.nix
  ];
}
