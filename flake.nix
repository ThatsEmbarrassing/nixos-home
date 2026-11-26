{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
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
      nixpkgs-unstable,
      home-manager,
      sops-nix,
      nix-flatpak,
      ...
    }@inputs:
    let
      user = rec {
        name = "user";
        directory = "/home/${name}";
      };
      arch = "x86_64-linux";
      pkgs = import nixpkgs {
        system = arch;
        config.allowUnfree = true;
      };
      unstable = import nixpkgs-unstable {
        system = arch;
        config.allowUnfree = true;
      };
    in
    {
      formatter.${arch} = pkgs.nixfmt-rfc-style;
      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
          inherit user;
          inherit arch;
          inherit unstable;
        };
        modules = [
          sops-nix.homeManagerModules.sops
          nix-flatpak.homeManagerModules.nix-flatpak
          ./home.nix
        ];
      };
    };
}
