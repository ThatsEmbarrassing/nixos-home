{ config, ... }:
let
  inherit (config.xdg) configHome;
in
{
  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    dotDir = "${configHome}/zsh";

    history = {
      size = 10000;
      save = 10000;

      path = "${configHome}/zsh/.zsh_history";
    };
  };
}
