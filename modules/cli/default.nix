{ ... }: {
  imports = [
    ./zsh
    ./git

    ./ssh.nix
    ./btop.nix
    ./eza.nix
    ./garbage.nix
    ./fastfetch.nix
    ./direnv.nix
    ./fzf.nix
    ./zoxide.nix
    ./prisma.nix
  ];
}
