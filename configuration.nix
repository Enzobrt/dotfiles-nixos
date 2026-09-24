# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  ...
}: {
  # Import stuff from other places
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./rtl8852bd
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
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
          selected_themes = ["optimus"];
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
      # TEMPORARY diagnostic: plymouth trace to /tmp/plymouth-boot.log.
      # No visual/boot-time impact. REMOVE after diagnosing the frozen splash.
      "plymouth.debug=stream:/tmp/plymouth-boot.log"
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
      libxtst
    ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
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

  programs.dconf.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
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

  # Brother DCP-L2620DW: it does not speak PCL/PostScript, but it does
  # support driverless IPP Everywhere over IPP-over-USB, so expose it as a
  # local IPP printer via ipp-usb and create the queue with "everywhere".
  services.ipp-usb.enable = true;

  # Resolve mDNS (.local) names so the printer is reachable over the network too.
  services.avahi.nssmdns4 = true;

  hardware.printers = {
    ensureDefaultPrinter = "Brother_DCP-L2620DW";
    ensurePrinters = [
      {
        name = "Brother_DCP-L2620DW";
        location = "Home";
        description = "Brother DCP-L2620DW";
        deviceUri = "ipp://localhost:60000/ipp/print";
        model = "everywhere";
        ppdOptions.PageSize = "A4";
      }
    ];
  };

  # ipp-usb only listens once the USB device is claimed, so wait for its
  # endpoint before running "lpadmin -m everywhere" (which queries the printer).
  systemd.services.ensure-printers = {
    wants = ["ipp-usb.service"];
    after = ["ipp-usb.service"];
    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 5;
      ExecStartPre = "${pkgs.writeShellScript "wait-for-ipp-usb" ''
        for _ in $(seq 1 120); do
          if (exec 3<>/dev/tcp/127.0.0.1/60000) 2>/dev/null; then
            exit 0
          fi
          sleep 1
        done
        exit 1
      ''}";
    };
  };

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
    extraGroups = ["networkmanager" "wheel" "kvm"];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Keep at most this many system generations (rollback depth).
  # This is also enforced on every nixos-rebuild.
  boot.loader.systemd-boot.configurationLimit = 5;

  # Scheduled garbage collecting.
  # NOTE: nix-collect-garbage does NOT accept --delete-generations;
  # the old value made nix-gc.service fail every run.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Limit profile generations: keep only the 10 most recent ones on every GC run
  # (nix.conf has no "keep-generations" setting, so we trim profiles explicitly).
  systemd.services.nix-gc.serviceConfig.ExecStart = lib.mkForce [
    ""
    (pkgs.writeShellScript "nix-gc-trim-generations" ''
      set +eu
      for profile in \
        /nix/var/nix/profiles/system \
        /nix/var/nix/profiles/default \
        /nix/var/nix/profiles/per-user/enzo/profile \
        /nix/var/nix/profiles/per-user/enzo/home-manager
      do
        if [ -L "$profile" ]; then
          ${config.nix.package}/bin/nix-env \
            -p "$profile" --delete-generations +10 2>/dev/null || true
        fi
      done
      exec ${config.nix.package}/bin/nix-collect-garbage --delete-older-than 14d
    '')
  ];

  # Hardware settings
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa.opencl
      rocmPackages.clr.icd
    ]; # habilita Rusticl (OpenCL)
  };

  # Bluetooth (Realtek RTL8852BU via patched btrtl).
  hardware.bluetooth.enable = true;

  # Scheduled optimise
  nix.optimise.automatic = true;
  nix.optimise.dates = ["daily"];

  nix.settings = {
    # Deduplicate store paths as they are added (same effect as nix optimise).
    auto-optimise-store = true;
    # Let GC drop .drv files and dev outputs that nothing references.
    keep-derivations = false;
    keep-outputs = false;
  };

  # Start automatic GC when free space drops below 5 GiB,
  # and free up to 50 GiB in one go.
  nix.extraOptions = ''
    min-free = ${toString (5 * 1024 * 1024 * 1024)}
    max-free = ${toString (50 * 1024 * 1024 * 1024)}
  '';

  # Cap the journal (was ~4 GiB).
  services.journald.extraConfig = ''
    SystemMaxUse=400M
    SystemMaxFileSize=50M
  '';

  # Disable xterm
  services.xserver.desktopManager.xterm.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Exclude system pkgs here ↓
  services.xserver.excludePackages = with pkgs; [
  ];

  # Exclude gnome environment pkgs here ↓
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-contacts
    gnome-connections # Remote machine access
    gnome-software
    gnome-weather
    epiphany
    gnome-maps
    papers # Document viewer
    seahorse # Passwords app
    showtime # Video player
    loupe # Image viewer !eog
    gnome-system-monitor # !resources
    decibels # Audio player
  ];

  # Install gnome environment pkgs here ↓
  environment.systemPackages = with pkgs; [
    keyd
  ];

  systemd.services.lenovo-conservation-mode = {
    description = "Enable Lenovo battery conservation mode";

    wantedBy = ["multi-user.target"];
    after = ["sys-devices-platform-VPC2004:00.device"];
    wants = ["sys-devices-platform-VPC2004:00.device"];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo 1 > /sys/bus/platform/devices/VPC2004:00/conservation_mode'";
    };
  };

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
      {
        from = 1714;
        to = 1764;
      }
    ];

    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
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
        ids = ["0001:0001:09b4e68d"];
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
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
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
