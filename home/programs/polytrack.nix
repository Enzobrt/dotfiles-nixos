{
  pkgs,
  lib,
  polytrack-src,
  ...
}: let
  # Build nativo de Linux de PolyTrack (Electron), descargado de itch.io:
  # https://kodub.itch.io/polytrack (gratis). Se declara como input del
  # flake en flake.nix.
  icon = pkgs.fetchurl {
    url = "https://img.itch.zone/aW1nLzI2MDUxNTMzLnBuZw==/315x250%23c/9Ods9%2B.png";
    hash = "sha256-S2CwUKNaZT7Nc2oRRCc0glhgFX7/xcSgwkVM+nZLmWg=";
  };

  libs = with pkgs; [
    alsa-lib
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    glib
    gtk3
    libdrm
    libglvnd
    libpulseaudio
    libxkbcommon
    mesa
    libgbm
    nspr
    nss
    pango
    udev
    xorg.libX11
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXdamage
    libxext
    libxfixes
    libxrandr
    stdenv.cc.cc.lib
  ];

  polytrack = pkgs.stdenv.mkDerivation {
    pname = "polytrack";
    version = "0.6.2";

    src = polytrack-src;

    nativeBuildInputs = with pkgs; [
      copyDesktopItems
      makeWrapper
    ];

    dontBuild = true;
    dontConfigure = true;
    dontStrip = true;
    dontUnpack = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/lib/polytrack $out/bin
      tar xzf $src -C $out/lib/polytrack
      chmod +x $out/lib/polytrack/PolyTrack

      makeWrapper $out/lib/polytrack/PolyTrack $out/bin/polytrack \
        --add-flags "--no-sandbox" \
        --set ELECTRON_DISABLE_SANDBOX 1 \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath libs}

      runHook postInstall
    '';

    postInstall = ''
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp ${icon} $out/share/icons/hicolor/256x256/apps/polytrack.png
    '';

    desktopItems = [
      (pkgs.makeDesktopItem {
        name = "polytrack";
        desktopName = "PolyTrack";
        icon = "polytrack";
        comment = "Juego de carreras low-poly con editor de pistas";
        categories = ["Game"];
        startupWMClass = "PolyTrack";
      })
    ];

    meta = with pkgs.lib; {
      description = "Low-poly time-trial racer by Kodub";
      homepage = "https://kodub.itch.io/polytrack";
      license = licenses.unfreeRedistributable;
      platforms = platforms.linux;
      mainProgram = "polytrack";
    };
  };
in {
  home.packages = [polytrack];
}
