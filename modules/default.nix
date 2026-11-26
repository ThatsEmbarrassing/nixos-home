{ ... }: {
  imports = [
    ./apps
    ./cli
    ./cosmic
    ./flatpak

    ./packages.nix
    ./fonts.nix
    ./clipboard.nix
    ./session.nix
  ];
}
