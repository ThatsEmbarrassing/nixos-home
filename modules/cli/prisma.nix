{ pkgs, ... }: {
  home.packages = with pkgs; [
    prisma_7
    prisma-engines_7
  ];

  home.sessionVariables = {
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
  };
}
