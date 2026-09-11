{
  pkgs,
  openbar-src,
  ...
}: let
  # ES-DE wrapper
  es-de = pkgs.appimageTools.wrapType2 {
    pname = "emulationstation-de";
    version = "3.4.1";

    src = pkgs.fetchurl {
      url = "https://gitlab.com/es-de/emulationstation-de/-/package_files/288156961/download";
      sha256 = "109mfa3aag6x4gf08326cbgs09dl403ygvaqm8yicmcdfd6s8q9w";
    };
  };

  # Curseforge wrapper
  curseforge = pkgs.appimageTools.wrapType2 {
    pname = "curseforge";
    version = "1.314";

    src = pkgs.fetchurl {
      url = "https://curseforge.overwolf.com/downloads/curseforge-latest-linux.AppImage";
      hash = "sha256-oyyafO42ysqodDbSog58kV3zg3F2ajVB1/ppeveaQK4=";
    };
  };

  # TinyWiiBackupManager wrapper
  tinywii = pkgs.appimageTools.wrapType2 {
    pname = "tinywii-backup-manager";
    version = "6.0.8";

    src = pkgs.fetchurl {
      url = "https://github.com/mq1/TinyWiiBackupManager/releases/download/v6.0.8/TinyWiiBackupManager-v6.0.8-linux-x86_64.AppImage";
      hash = "sha256-vwsghjm2r8FhKjSyxBg//AN12O7qwLZ5uNu/ndl0WCo=";
    };

    extraPkgs = pkgs:
      with pkgs; [
        zenity
      ];

    extraEnv = {
      TWBM_DISABLE_UPDATES = "1";
    };
  };

  # Audacity 4
  audacity-4 = pkgs.appimageTools.wrapType2 {
    pname = "audacity-4";
    version = "4.0.0";

    src = pkgs.fetchurl {
      url = "https://github.com/audacity/audacity/releases/download/Audacity-4.0.0/audacity-linux-4.0.0-x86_64.AppImage";
      hash = "sha256-dyZjsLQHvkQjIZO4QCzeTaRmXH9uge21tw47FOi5tbQ=";
    };
  };

  # Cartridges
  cartridges-fixed = pkgs.cartridges.overrideAttrs (oldAttrs: {
    postPatch =
      (oldAttrs.postPatch or "")
      + ''
        substituteInPlace cartridges/window.py \
          --replace-fail 'label=games_no,' 'label=str(games_no),'
      '';
  });

  # Openbar - gnome 50
  openbar = pkgs.stdenvNoCC.mkDerivation {
    pname = "openbar";
    version = "50";

    src = openbar-src;

    installPhase = ''
      mkdir -p $out/share/gnome-shell/extensions/openbar@neuromorph
      cp -r ./* $out/share/gnome-shell/extensions/openbar@neuromorph/
    '';
  };
in {
  home.packages = with pkgs; [
    ## System
    #vicinae # Desactivado xq se configurar en viciane.nix
    wine
    xclicker

    openbar

    ## Gnome
    baobab
    nautilus
    eog
    gnome-control-center
    gnome-tweaks
    resources
    simple-scan

    pika-backup
    cartridges-fixed
    gnome-music
    gnome-calculator
    switcheroo
    #junction

    ## Internet
    brave
    syncthing
    kdePackages.kdeconnect-kde
    signal-desktop
    vesktop # Activado porque vesktop.nix reinicia la configuracion

    ## Office
    vim
    #audacity
    audacity-4
    libreoffice
    gimp
    obs-studio
    zathura
    blender
    obsidian
    keepassxc
    #arduino

    ## Game making
    godot
    #unityhub

    ## Games
    gamemode
    tinywii

    #mindustry-wrapper

    steam
    modrinth-app
    curseforge
    r2modman

    retroarch-full
    es-de
    rpcs3
    ryubing
    dolphin-emu

    ## Media
    mpv
    jellyfin
    #vlc

    ani-cli # Descargar animes y mangas

    kdePackages.kdenlive

    ## AI
    ollama
    opencode

    ## Automation
    crossmacro

    ## Terminal
    ghostty
    dmenu
    wofi
    rofi
    fuzzel

    lf
    yazi
    fzf
    tree
    bat

    fastfetch
    lm_sensors
    btop

    tldr

    dconf2nix

    ffmpeg
    ncmpcpp
    mpc
    mpd
    mpd-mpris
    wiremix
    yt-dlp
    patch

    wifitui

    typer

    ydotool

    alejandra

    wget
    curl
    unzip
    zip
    gh
    pandoc
    stow
    cmake
    ninja
    nodejs
    openjdk
    #plocate
    arandr
    tree-sitter
    eww
    gnumake
    gcc
    fd
    ripgrep
    zenity
    libnotify

    ## Programming
    go
    (python313.withPackages (ps:
      with ps; [
        pandas
        pygame
        matplotlib
        mplcursors
        numpy
        keyboard
      ]))
  ];

  home.file.".local/share/applications/es-de.desktop".text = ''
    [Desktop Entry]
    Name=ES-DE
    Comment=EmulationStation Desktop Edition
    Exec=emulationstation-de
    Icon=applications-games
    Terminal=false
    Type=Application
    Path=/home/enzo
    Categories=Game;Emulator;
  '';

  home.file.".local/share/applications/curseforge.desktop".text = ''
    [Desktop Entry]
    Name=CurseForge
    Comment=CurseForge Mod Manager
    Exec=curseforge
    Icon=applications-games
    Terminal=false
    Type=Application
    Categories=Game;
  '';

  home.file.".local/share/applications/audacity-4.desktop".text = ''
    [Desktop Entry]
    Name=Audacity 4
    Comment=Audio editor
    Exec=audacity-4
    Icon=audio-x-generic
    Terminal=false
    Type=Application
    Path=/home/enzo
    Categories=Audio;AudioVideo;
  '';
}
