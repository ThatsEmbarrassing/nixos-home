{ config, pkgs, ... }:
let
  homeDirectory = config.home.homeDirectory;
in
{
  home.packages = with pkgs; [
    sops
    age
    ssh-to-age
  ];

  sops = {
    age.sshKeyPaths = [ "${homeDirectory}/.ssh/id_ed25519-sops" ];
    defaultSopsFormat = "yaml";
  };
}
