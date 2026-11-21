{ pkgs, ... }: {
  programs.btop = {
    enable = true;

    package = pkgs.btop.override { cudaSupport = true; };

    settings = {
      color_theme = "dracula";
      theme_background = false;
      truecolor = true;
      graph_symbol = "braille";
      shown_boxes = "cpu mem net proc gpu0";
      shown_gpus = "nvidia";
      update_ms = 1000;
      proc_sorting = "cpu lazy";
      proc_tree = false;
      check_temp = true;
      only_physical = true;
    };
  };
}
