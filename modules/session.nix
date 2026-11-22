{ pkgs, ... }: {
  home.sessionVariables = {
    EDITOR = "zeditor --wait";

    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
