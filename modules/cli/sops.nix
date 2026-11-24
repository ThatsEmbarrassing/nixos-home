{ config, ... }:
let
  homeDirectory = config.home.homeDirectory;
in
{

  sops = {
    age.sshKeyPaths = [ "${homeDirectory}/.ssh/id_ed25519-sops" ];
    defaultSopsFormat = "yaml";
  };
}
