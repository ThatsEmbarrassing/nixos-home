{ pkgs, ... }: {
  home.sessionVariables = {
    EDITOR = "zeditor";

    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
