{ pkgs, ... }: {
  home.packages = with pkgs; [
    lazydocker
  ];

  home.sessionVariables = {
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
  };
}
