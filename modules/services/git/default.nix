{ ... }: {
  imports = [
    (import ./git-forge.nix {
      host = "github.com";
      keyname = "github";
    })
    (import ./git-forge.nix {
      host = "gitlab.com";
      keyname = "gitlab";
    })
  ];
}
