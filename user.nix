{ user, ... }: {
  home.username = user.name;
  home.homeDirectory = user.directory;
}
