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

    openbar-src = {
      url = "github:jasonpiedrasantasdk/openbar/1baac47244ecd0fad31196240963cf0738ef7beb";
      flake = false;
    };

    opencode.url = "github:anomalyco/opencode/014614d35b397775e5d397a490fc72368c894ec2";

    # Build nativo de Linux de PolyTrack (Electron), descargado de itch.io
    polytrack-src = {
      url = "path:/home/enzo/Games/polytrack-linux-x64.tar.gz";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    vicinae,
    vicinae-extensions,
    openbar-src,
    opencode,
    polytrack-src,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit home-manager opencode;
      };

      modules = [
        ./configuration.nix
        (
          {opencode, ...}: {
            nixpkgs.overlays = [
              (final: prev: {
                opencode = opencode.packages.${final.stdenv.hostPlatform.system}.default;
              })
            ];

            environment.systemPackages = [
              home-manager.packages.x86_64-linux.default
            ];
          }
        )

        vicinae.nixosModules.default

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.extraSpecialArgs = {
            inherit vicinae vicinae-extensions openbar-src polytrack-src;
            colors = import ./home/colors.nix;
          };

          home-manager.users.enzo = {
            config,
            lib,
            pkgs,
            ...
          }: {
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
