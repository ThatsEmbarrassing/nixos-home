{ ... }: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = true;
    exitShellOnExit = false;

    settings = {
      theme = "dracula";
    };
  };
}
