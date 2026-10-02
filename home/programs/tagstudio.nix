{
  inputs,
  pkgs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;

  # Upstream declara Pygments en pyproject.toml pero su nix/package/default.nix no
  # lo incluye en `dependencies`, asi que pythonRuntimeDepsCheckHook aborta el
  # build con "pygments not installed". Se lo añadimos con overridePythonAttrs.
  # El nixpkgs que fija TagStudio trae pygments 2.20 y el wheel pide ~=2.21, de
  # ahi el relaxDeps. Nota: hay que tomar python3Packages del nixpkgs del propio
  # input de TagStudio, no del global, porque no sigue el nixpkgs de este flake.
  python3Packages = inputs.tagstudio.inputs.nixpkgs.legacyPackages.${system}.python3Packages;
in {
  home.packages = [
    (inputs.tagstudio.packages.${system}.tagstudio.overridePythonAttrs (old: {
      dependencies = old.dependencies ++ [python3Packages.pygments];
      pythonRelaxDeps = old.pythonRelaxDeps ++ ["pygments"];
    }))
  ];
}
