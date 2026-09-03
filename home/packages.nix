{ config, pkgs, ... }:

let
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
      hash = "sha256-ZH4ZkFSoT8bQgcQPkszcux4gds4DHwrD7Vyub+13mgQ=";
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

    extraPkgs = pkgs: with pkgs; [
      zenity
    ];

    extraEnv = {
      TWBM_DISABLE_UPDATES = "1";
    };
  };

  # Cartridges: fix Gtk.Label receiving an int instead of a string
  cartridges-fixed = pkgs.cartridges.overrideAttrs (oldAttrs: {
    postPatch = (oldAttrs.postPatch or "") + ''
      substituteInPlace cartridges/window.py \
        --replace-fail 'label=games_no,' 'label=str(games_no),'
    '';
  });

in

{
  home.packages = with pkgs; [
    ## System
    #vicinae
    wine
    xclicker
    font-manager

    ## Gnome
    baobab
    nautilus
    eog
    gnome-control-center
    gnome-tweaks
    resources

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
    audacity
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

    ## Media
    mpv
    jellyfin
    #vlc

    kdePackages.kdenlive
    davinci-resolve

    ## Terminal
    ghostty
    wofi #rofi is not supported in gnome

    lf
    yazi
    fzf
    tree
    bat

    fastfetch
    lm_sensors
    btop

    ncmpcpp
    mpc
    mpd
    mpd-mpris
    wiremix

    ydotool

    tldr

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

    #impala
    #iwd # Enable at your own risk

    ## Gnome extensions
    gnomeExtensions.lan-ip-address
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.fly-pie

    ## Programming
    go
    (python313.withPackages (ps: with ps; [
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

  home.file.".local/share/applications/tinywii.desktop".text = ''
    [Desktop Entry]
    Name=TinyWiiBackupManager
    Comment=Wii and GameCube backup manager
    Exec=tinywii-backup-manager
    Icon=applications-games
    Terminal=false
    Type=Application
    Path=/home/enzo
    Categories=Game;
  '';
}
