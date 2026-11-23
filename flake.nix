{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cosmic-manager = {
      url = "github:HeitorAugustoLN/cosmic-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.8.0";

    uniclipboard = {
      url = "github:UniClipboard/UniClipboard/v1.6.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }@inputs:
    let
      user = rec {
        name = "user";
        directory = "/home/${name}";
      };
      arch = "x86_64-linux";
    in
    {
      formatter.${arch} = nixpkgs.legacyPackages.${arch}.nixfmt-rfc-style;
      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = arch;
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
          inherit user;
          inherit arch;
        };
        modules = [
          nix-flatpak.homeManagerModules.nix-flatpak
          ./home.nix
        ];
      };
    };
}
