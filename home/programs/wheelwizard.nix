{pkgs, ...}: let
  wheelwizard = pkgs.stdenv.mkDerivation {
    pname = "wheelwizard";
    version = "2.5.7";

    src = pkgs.fetchurl {
      url = "https://github.com/TeamWheelWizard/WheelWizard/releases/download/v2.5.7/WheelWizard_Linux";
      hash = "sha256-RsND4drVu3sO5riym3GgRU5sFRogBVsI6dCl88MTGv8=";
    };

    icon = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/TeamWheelWizard/WheelWizard/v2.5.7/Flatpak/io.github.TeamWheelWizard.WheelWizard.png";
      hash = "sha256-0FWum5kdqU0BZZjZPjbwF3xglZgAEkDMbK6W9uVkoe4=";
    };

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      copyDesktopItems
      makeWrapper
    ];

    buildInputs = with pkgs; [
      wayland
      libxkbcommon
      libdrm
      libdecor
      mesa.out
      libGL
      libx11
      libxcursor
      libxi
      libxrandr
      libxext
      libxfixes
      libxrender
      libxinerama
      libxcb
      fontconfig
      freetype
      glib
      zlib
      icu
      stdenv.cc.cc.lib
    ];

    autoPatchelfIgnoreMissingDeps = [
      "libcoreclr.so"
      "libhostpolicy.so"
      "libhostfxr.so"
      "libSystem.Native.so"
    ];

    desktopItems = [
      (pkgs.makeDesktopItem {
        name = "wheelwizard";
        exec = "WheelWizard";
        icon = "io.github.TeamWheelWizard.WheelWizard";
        comment = "Mario Kart Wii Mod Manager & Retro Rewind Auto Updater";
        desktopName = "Wheel Wizard";
        genericName = "Mario Kart Wii Mod Manager";
        categories = ["Game"];
        startupWMClass = "WheelWizard";
      })
    ];

    dontUnpack = true;
    dontBuild = true;
    dontConfigure = true;
    dontStrip = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/lib/wheelwizard
      install -m755 $src $out/lib/wheelwizard/WheelWizard

      mkdir -p $out/bin
      makeWrapper $out/lib/wheelwizard/WheelWizard $out/bin/WheelWizard \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [
        pkgs.icu.out
        pkgs.libglvnd
        pkgs.wayland
        pkgs.libxkbcommon
        pkgs.libdrm
        pkgs.libdecor
        pkgs.mesa.out
        pkgs.libGL
        pkgs.libx11
        pkgs.libxcursor
        pkgs.libxi
        pkgs.libxrandr
        pkgs.libxext
        pkgs.libxfixes
        pkgs.libxrender
        pkgs.libxinerama
        pkgs.libxcb
        pkgs.libICE
        pkgs.libSM
        pkgs.zlib
        pkgs.openssl.out
        pkgs.fontconfig.lib
        pkgs.freetype
        pkgs.glib
        pkgs.stdenv.cc.cc.lib
      ]}

      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp $icon $out/share/icons/hicolor/256x256/apps/io.github.TeamWheelWizard.WheelWizard.png

      runHook postInstall
    '';

    meta = with pkgs.lib; {
      description = "Mario Kart Wii Mod Manager & Retro Rewind Auto Updater";
      homepage = "https://github.com/TeamWheelWizard/WheelWizard";
      license = licenses.gpl3;
      platforms = platforms.linux;
      mainProgram = "WheelWizard";
    };
  };
in {
  home.packages = [wheelwizard];
}
