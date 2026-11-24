{
  config,
  pkgs,
  unstable,
  ...
}:
let
  tomlFormat = pkgs.formats.toml { };

  publicSettings = tomlFormat.generate "lazysql.toml" {
    theme = {
      Preset = "dracula";
    };
  };
in
{
  home.packages = with unstable; [
    lazysql
  ];

  sops = {
    secrets."lazysql_databases" = {
      sopsFile = ../../../secrets/lazysql.toml;
      format = "binary";
    };

    templates."lazysql-config.toml" = {
      path = "${config.xdg.configHome}/lazysql/config.toml";
      mode = "0600";
      content = ''
        ${builtins.readFile publicSettings}
        ${config.sops.placeholder."lazysql_databases"}
      '';
    };
  };
}
