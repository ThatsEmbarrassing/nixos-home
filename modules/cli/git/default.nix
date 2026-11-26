{ ... }: {
  imports = [
    # GitHub
    (import ./git-forge.nix {
      host = "github.com";
      keyname = "github";
    })

    # Gitlab
    (import ./git-forge.nix {
      host = "gitlab.com";
      keyname = "gitlab";
    })

    ./settings.nix
  ];

  programs.git.enable = true;
}
