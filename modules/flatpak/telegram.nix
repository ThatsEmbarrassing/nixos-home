{ ... }: {
  services.flatpak = {
    packages = [ "org.telegram.desktop" ];

    overrides."org.telegram.desktop" = {
      Context = {
        "filesystems" = [ "/nix/store:ro" ];
        sockets = [
          "x11"
          "fallback-x11"
          "!wayland"
        ];
      };

      Environment = {
        QT_QPA_PLATFORM = "xcb";
      };
    };
  };
}
