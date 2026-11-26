{ ... }: {
  imports = [
    ./apps
    ./cli
    ./cosmic
    ./flatpak

    ./packages.nix
    ./fonts.nix
    ./session.nix
  ];
}
