{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    vicinae.url = "github:vicinaehq/vicinae";

    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, vicinae, vicinae-extensions, ... }:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix
        vicinae.nixosModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.extraSpecialArgs = {
            inherit vicinae vicinae-extensions;
            colors = import ./home/colors.nix;
          };

          home-manager.users.enzo = { config, lib, pkgs, ... }: {
            imports = [
              vicinae.homeManagerModules.default
              nix-flatpak.homeManagerModules.nix-flatpak
              ./home/home.nix
            ];
          };
        }
      ];
    };
  };
}
