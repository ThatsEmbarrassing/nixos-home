{ host, keyname }: {
  programs.git.settings.url = {
    "git@${host}:".insteadOf = "https://${host}/";
  };

  programs.ssh.settings = {
    ${host} = {
      HostName = host;
      User = "git";
      IdentityFile = "~/.ssh/id_ed25519-${keyname}";
      IdentitiesOnly = "yes";
    };
  };
}
