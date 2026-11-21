{ ... }: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;

    options = [ "--cmd cd" ];
  };

  home.sessionVariables = {
    _ZO_FZF_OPTS = "--preview 'eza --tree --level=2 --color=always --icons {2..}' --preview-window=right:50%:wrap";
  };
}
