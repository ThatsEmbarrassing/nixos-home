{ ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [ "nerd-font-symbols" ];
    settings = {
      add_newline = true;
      character.success_symbol = "[>>>](bold green)";
      character.error_symbol = "[>>>](bold red)";

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch.format = "[$symbol$branch(:$remote_branch)]($style)";

      git_status.format = "([\\[$all_status$ahead_behind\\]]($style))";

      nodejs = {
        format = "[$symbol($version )]($style)";
        detect_files = [
          "package.json"
          ".node-version"
          ".nvmrc"
        ];
        detect_folders = [ "node_modules" ];
      };

      nix_shell = {
        heuristic = true;
        format = "[$symbol$state(\\($name\\))]($style) ";
        impure_msg = "impure";
        pure_msg = "pure";
      };
    };
  };
}
