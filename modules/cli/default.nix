{ ... }: {
  imports = [
    ./zsh
    ./git

    ./ssh.nix
    ./btop.nix
    ./node.nix
    ./eza.nix
    ./sops.nix
    ./nh.nix
    ./fastfetch.nix
    ./direnv.nix
    ./fzf.nix
    ./zoxide.nix
    ./prisma.nix
  ];
}
