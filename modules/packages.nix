{ pkgs, inputs, ... }:
let
  uniclipboardPkg =
    inputs.uniclipboard.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs
      (old: rec {
        version = "1.6.2";
        src = pkgs.fetchurl {
          url = "https://github.com/UniClipboard/UniClipboard/releases/download/v${version}/UniClipboard_${version}_amd64.deb";
          hash = "sha256-9Db9ciyzIIOg7/NHdshCG9AQ55cOlilnXGNEcNh5rOo=";
        };
        buildInputs = (old.buildInputs or [ ]) ++ [
          pkgs.gtk4
          pkgs.webkitgtk_6_0
        ];
      });
in
{
  home.packages = with pkgs; [
    obsidian
    discord
    opencode
    yaak
    vivaldi
    vivaldi-ffmpeg-codecs
    openssl

    uniclipboardPkg
  ];
}
