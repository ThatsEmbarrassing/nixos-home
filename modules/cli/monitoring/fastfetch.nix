{ ... }: {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "auto";
      };

      display = {
        separator = " -> ";
      };

      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "resolution"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "colors"
      ];
    };
  };
}
