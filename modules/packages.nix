{ pkgs, inputs, ... }:
let
  uniclipboardPkg = inputs.uniclipboard.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    releaseSources = {
      version = "1.6.2";
      gtkMajor = 4;
      hashes.x86_64-linux = "sha256-9Db9ciyzIIOg7/NHdshCG9AQ55cOlilnXGNEcNh5rOo=";
    };
  };
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
