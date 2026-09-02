# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Import stuff from other places
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.flatpak.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot = {
    plymouth = {
      enable = true;
      theme = "optimus";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "optimus" ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 5;
  };

  # Allows for executing binaries compiled for generic Linux distributions
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      libGL
      libglvnd
      mesa
      SDL2
      alsa-lib
      libpulseaudio
      libX11
      libXext
      libXcursor
      libXi
      libXrandr
      libXfixes
      libXrender
      libXinerama
      libxcb
      zlib
      stdenv.cc.cc.lib
      fontconfig
      freetype
      glib
      pango
      cairo
      dbus
    ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."enzo" = {
    isNormalUser = true;
    description = "enzo";
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  nixpkgs.config.android_sdk.accept_license = true;

  # Scheduled garbage collecting
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-generations +10"; # Or use a custom script for count-based pruning
  };

  # Hardware settings
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa.opencl
      rocmPackages.clr.icd
    ]; # habilita Rusticl (OpenCL)
  };

  # Scheduled optimise
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "Mon 04:00" "Fri 04:00" ]; # Optional; allows customizing optimisation schedule

  # Free up to 1GiB whenever there is less than 100MiB left:
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';

  # Disable xterm
  services.xserver.desktopManager.xterm.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Exclude system pkgs here ↓
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  # Exclude gnome environment pkgs here ↓
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs

    xterm
  ];
  
  # Install gnome environment pkgs here ↓
  environment.systemPackages = with pkgs; [
    keyd
    android-studio
    android-tools

    # Gnome extensions
    gnomeExtensions.lan-ip-address
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      25565
      8384
      22000

      # Mindustry
      6567
    ];

    allowedUDPPorts = [
      25565
      21027
      22000

      # Mindustry
      6567
    ];

    allowedTCPPortRanges = [
      { from = 1714; to = 1764; }
    ];

    allowedUDPPortRanges = [
      { from = 1714; to = 1764; }
    ];
  };

  services.syncthing = {
    enable = true;
    user = "enzo";
    dataDir = "/home/enzo";
    configDir = "/home/enzo/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        movil-z = {
          id = "44OHJTC-ECJ7PNX-ONID3CA-XLALCUO-SHUQO4M-NFWKHMI-MYYRZM6-TMDAHQC";
        };
      };

      folders = {
        keepassxce = {
          path = "~/Documents/keepass/";
          devices = [ "movil-z" ];
        };
        notas-obsidian = {
          path = "~/Documents/notas-obsidian";
          devices = [ "movil-z" ];
        };
        music = {
          path = "~/Music";
          devices = [ "movil-z" ];
        };
        roms = {
          path = "~/Documents/Games/roms";
          devices = [ "movil-z" ];
          ignorePatterns = [
            "ds"
            "gc"
            "ps*"
            "switch"
            "mount-arkos*"
          ];
        };
      };
    };
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        # the id of your keyboard taken from the monitor command - specifying it here and not using a wildcard * might avoid the aforementioned libinput issue with palm rejection.
        ids = [ "0001:0001:09b4e68d" ];
        settings = {
          main = {
            # taking the key combination from the monitor command and remapping it to meta / super key
            "leftshift+leftmeta+f23" = "layer(meta)";
          };
        };
      };
    };
  };
  
  programs.java.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;  # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
  };

  programs.steam.extraPackages = with pkgs; [
    gamescope
    jdk
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
