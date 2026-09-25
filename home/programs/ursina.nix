{
  pkgs,
  lib,
  ...
}: let
  # Runtime de C++/OpenGL/X11. Los wheels de Panda3D vienen de PyPI (no hay
  # paquete en nixpkgs) y resuelven sus dependencias por LD_LIBRARY_PATH.
  libs = with pkgs; [
    alsa-lib
    libglvnd
    mesa
    libxkbcommon
    libpulseaudio
    udev
    xorg.libX11
    xorg.libXext
    libxcursor
    libxinerama
    libxi
    libxrandr
    stdenv.cc.cc.lib
  ];

  # Ursina (y panda3d-gltf) solo existen en PyPI, asi que se instalan con pip en
  # un venv que crea Home Manager. pygame-ce tambien va aqui para que el LSP de
  # nvim (pylsp) resuelva los imports de los dos motores. Para actualizar:
  # ~/.local/share/ursina-env/bin/pip install -U ursina pygame-ce
  venvDir = ".local/share/ursina-env";

  # Se reinstala el venv cuando cambie esta lista (no en cada switch).
  requirements = pkgs.writeText "ursina-requirements.txt" ''
    ursina
    pygame-ce
  '';

  ursina = pkgs.writeShellApplication {
    name = "ursina";
    runtimeInputs = [pkgs.python313];
    text = ''
      export LD_LIBRARY_PATH="${lib.makeLibraryPath libs}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
      exec "$HOME/${venvDir}/bin/python" "$@"
    '';
  };
in {
  home.packages = [ursina];

  home.activation.ursinaEnv = lib.hm.dag.entryAfter ["installPackages"] ''
    target="$HOME/${venvDir}"
    stamp="$target/.requirements"
    wanted=$(sha256sum < "${requirements}" | cut -d' ' -f1)
    current=$(cat "$stamp" 2>/dev/null || true)
    if [ ! -x "$target/bin/python" ] || [ "$wanted" != "$current" ]; then
      echo "Instalando Ursina y pygame-ce en el venv (solo si cambian los requisitos)..."
      export PATH=${lib.makeBinPath [pkgs.python313 pkgs.gcc pkgs.cmake pkgs.ninja]}
      ${pkgs.python313}/bin/python3 -m venv "$target"
      "$target/bin/pip" install --quiet --upgrade pip
      "$target/bin/pip" install --quiet --upgrade -r "${requirements}"
      printf '%s' "$wanted" > "$stamp"
    fi
  '';
}
