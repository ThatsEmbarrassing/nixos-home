{ config, pkgs, ... }:
let
  homeDirectory = config.home.homeDirectory;
  globalStorage = "${homeDirectory}/.npm-global";

  npm.packages.minReleaseDays = 7;
in
{
  programs.npm = {
    enable = true;
    package = pkgs.nodejs_24;
    settings = {
      save-exact = true;
      min-release-age = npm.packages.minReleaseDays;
      prefix = globalStorage;
      fund = false;
    };
  };

  home.sessionPath = [
    "${globalStorage}/bin"
  ];
}
