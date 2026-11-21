{ config, ... }: {
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
