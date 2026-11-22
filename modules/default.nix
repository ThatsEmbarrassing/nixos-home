{ ... }: {
  imports = [
    ./apps
    ./cli
    ./cosmic
    ./flatpak

    ./packages.nix
    ./session.nix
  ];
}
