{ ... }: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;

    options = [ "--cmd cd" ];
  };

  programs.zsh.sessionVariables = {
    _ZO_FZF_OPTS = "--preview 'eza --tree --level=2 --color=always --icons=always {2..}' --preview-window=right:50%:wrap";
  };
}
