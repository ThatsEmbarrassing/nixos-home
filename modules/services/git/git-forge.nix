{ host, keyname }: {
  programs.ssh.matchBlocks."${host}" = {
    hostname = host;
    user = "git";
    identityFile = "~/.ssh/id_ed25519-${keyname}";
    identitiesOnly = true;
  };

  programs.git.settings = {
    url."git@${host}:".insteadOf = "https://${host}/";
  };
}
