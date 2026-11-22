{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = true;

    extraPackages = with pkgs; [
      nil
      nixfmt
    ];

    extensions = [
      "nix"
      "toml"
    ];

    userSettings.languages.Nix.formatter.external = {
      command = "nixfmt";
    };
  };
}
