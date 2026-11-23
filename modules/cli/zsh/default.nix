{ config, ... }: {
  imports = [
    ./plugins.nix
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      size = 10000;
      save = 10000;

      path = "${config.xdg.configHome}/zsh/.zsh_history";
    };

    envExtra = ''
      export ZDOTDIR="$HOME/.config/zsh"
    '';

  };
}
