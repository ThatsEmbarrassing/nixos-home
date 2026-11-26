{ config, ... }: {
  programs.git.settings = {
    user = {
      name = "Ember";
      email = "Ember@noreply.local";
    };

    core.editor = config.home.sessionVariables.EDITOR;

    init.defaultBranch = "main";
    pull.rebase = true;
    fetch.prune = true;
    push.autoSetupRemote = true;

    alias = {
      co = "checkout";
      st = "status";
      cm = "commit -m";
      lg = "log --oneline --graph --decorate";
    };
  };
}
