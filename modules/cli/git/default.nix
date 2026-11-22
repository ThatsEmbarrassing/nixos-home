{ config, ... }: {
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
  ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Ember";
        email = "Ember@noreply.local";
      };

      core.editor = config.home.sessionVariables.EDITOR;
    };
  };
}
