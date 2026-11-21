{ ... }: {
  programs.zsh = {
    shellAliases = {
      ls = "eza --tree -l -U -L 2 --no-user";
    };
  };
}
