# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = ["gnupg://"];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 600;
    };

    "com/belmoussaoui/Decoder" = {
      is-maximized = false;
      window-height = 660;
      window-width = 420;
    };

    "com/github/FontManager/FontManager" = {
      browse-mode = "list";
      browse-pane-position = 54.94736842105263;
      browse-preview-visible = true;
      content-size = 39.81623277182236;
      hor-content-size = 35.987748851454825;
      is-maximized = false;
      mode = "browse";
      prefer-dark-theme = true;
      preview-background-color = "rgb(0,0,0)";
      preview-foreground-color = "rgb(255,255,255)";
      sidebar-size = 32.94736842105263;
      window-size = mkTuple [950 700];
    };

    "com/github/FontManager/FontViewer" = {
      prefer-dark-theme = true;
      preview-background-color = "rgb(0,0,0)";
      preview-foreground-color = "rgb(255,255,255)";
      window-size = mkTuple [675 500];
    };

    "io/gitlab/adhami3310/Converter" = {
      dpi = 300;
      is-maximized = false;
      output-format = "Gif";
      quality = 92;
      window-height = 750;
      window-width = 750;
    };

    "net/nokyan/Resources" = {
      is-maximized = true;
      window-height = 900;
      window-width = 1024;
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = ["$HOME" "&DOCUMENTS" "&DOWNLOAD" "&MUSIC" "&PICTURES" "&VIDEOS"];
    };

    "org/gnome/Connections" = {
      first-run = false;
      window-size = mkTuple [1024 768];
    };

    "org/gnome/Console" = {
      last-window-maximised = true;
      last-window-size = mkTuple [732 528];
    };

    "org/gnome/Extensions" = {
      window-maximized = true;
    };

    "org/gnome/Mines" = {
      window-height = 400;
      window-is-maximized = false;
      window-width = 600;
    };

    "org/gnome/Music" = {
      window-maximized = true;
    };

    "org/gnome/Showtime/State" = {
      is-maximized = false;
    };

    "org/gnome/Snapshot" = {
      capture-mode = "qr-detection";
      is-maximized = false;
      last-camera-id = "Integrated Camera (V4L2)";
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      last-save-directory = "file:///home/enzo/Downloads";
      right-margin-position = mkUint32 77;
      show-line-numbers = true;
      show-map = false;
      show-right-margin = false;
      style-scheme = "cobalt";
      tab-width = mkUint32 4;
      use-system-font = true;
    };

    "org/gnome/Weather" = {
      window-height = 268;
      window-maximized = true;
      window-width = 472;
    };

    "org/gnome/baobab/ui" = {
      active-chart = "rings";
      is-maximized = true;
      window-size = mkTuple [960 600];
    };

    "org/gnome/calculator" = {
      base = 10;
      button-mode = "basic";
      source-units = ["degree"];
      target-units = ["radian"];
      unit-category = "angle";
      window-maximized = false;
      window-size = mkTuple [360 616];
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [768 600];
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [870 690];
    };

    "org/gnome/control-center" = {
      last-panel = "system";
      window-state = mkTuple [980 640 true];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/a11y/magnifier" = {
      cross-hairs-length = 58;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["YaST" "Pardus" "68d11a98-c872-4265-8639-bcb520fdb4d9" "25ee6d73-d41b-4ada-b5a4-ef776b8c042e" "a91e49cb-cc2b-4cdb-95e5-8c02e6d4dcfc" "946b3c76-88f4-480d-9f53-6ad94ca33940" "10934f49-0e58-47f3-8946-b095f6f55c10" "55f20195-5c50-4732-8fec-8e3d19e0669d" "a5efa915-bcc7-4772-9370-efce7e2841ae" "f64750be-6563-4c26-b5d0-bb6ae983d53f" "00612f99-8b7f-4bed-9ee0-a19d7636c610" "0cfb78d2-030e-4ef5-be85-77458ee715c3"];
    };

    "org/gnome/desktop/app-folders/folders/00612f99-8b7f-4bed-9ee0-a19d7636c610" = {
      apps = ["com.github.FontManager.FontManager.desktop" "com.github.FontManager.FontViewer.desktop"];
      name = "Font";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/0cfb78d2-030e-4ef5-be85-77458ee715c3" = {
      apps = ["davinci-resolve.desktop" "davinci-fairlight-studio-utility.desktop" "blackmagicraw-speedtest.desktop" "blackmagicraw-player.desktop" "davinci-control-panels-setup.desktop"];
      name = "Davinci resolve";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/10934f49-0e58-47f3-8946-b095f6f55c10" = {
      apps = ["org.gnome.TextEditor.desktop" "org.gnome.eog.desktop" "org.gnome.Yelp.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Calendar.desktop" "org.gnome.tweaks.desktop" "org.gnome.Extensions.desktop" "org.gnome.Settings.desktop" "net.nokyan.Resources.desktop" "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.SimpleScan.desktop" "org.gnome.Characters.desktop" "cups.desktop" "org.gnome.Calculator.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Snapshot.desktop" "io.gitlab.adhami3310.Converter.desktop" "org.gnome.Logs.desktop" "org.gnome.clocks.desktop"];
      name = "gnome bs";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/25ee6d73-d41b-4ada-b5a4-ef776b8c042e" = {
      apps = ["startcenter.desktop" "base.desktop" "calc.desktop" "draw.desktop" "impress.desktop" "math.desktop" "writer.desktop"];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/55f20195-5c50-4732-8fec-8e3d19e0669d" = {
      apps = ["com.mitchellh.ghostty.desktop" "org.gnome.Console.desktop" "lf.desktop" "btop.desktop" "xterm.desktop" "yazi.desktop"];
      name = "Terminal bs";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/68d11a98-c872-4265-8639-bcb520fdb4d9" = {
      apps = ["Mindustry.desktop" "com.libretro.RetroArch.desktop" "steam.desktop" "curseforge.desktop" "Modrinth App.desktop" "es-de.desktop" "tinywii.desktop" "Ryujinx.desktop" "rpcs3.desktop" "R.E.P.O..desktop" "r2modman.desktop" "org.vinegarhq.Sober.desktop" "page.kramo.Cartridges.desktop"];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/946b3c76-88f4-480d-9f53-6ad94ca33940" = {
      apps = ["vim.desktop" "nvim.desktop" "obsidian.desktop"];
      name = "Text editors";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/a5efa915-bcc7-4772-9370-efce7e2841ae" = {
      apps = ["brave-browser.desktop" "vesktop.desktop" "signal.desktop" "syncthing-ui.desktop" "syncthingtray.desktop" "org.kde.kdeconnect.app.desktop" "org.kde.kdeconnect.nonplasma.desktop" "org.kde.kdeconnect.sms.desktop"];
      name = "Internet";
    };

    "org/gnome/desktop/app-folders/folders/a91e49cb-cc2b-4cdb-95e5-8c02e6d4dcfc" = {
      apps = ["mpv.desktop" "audacity.desktop" "org.gnome.Music.desktop" "org.kde.kdenlive.desktop" "blender.desktop" "gimp.desktop" "org.pwmt.zathura.desktop" "audacity-4.desktop"];
      name = "Sound & Video";
    };

    "org/gnome/desktop/app-folders/folders/f64750be-6563-4c26-b5d0-bb6ae983d53f" = {
      apps = ["org.godotengine.Godot4.6.desktop" "unityhub.desktop" "arduino.desktop" "android-studio.desktop"];
      name = "Programming";
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///etc/nixos/home/assets/wallpaper.png";
      picture-uri-dark = "file:///etc/nixos/home/assets/wallpaper.png";
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = mkUint32 300;
      interval-seconds = mkUint32 1800;
      play-sound = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = false;
      week-start-day = "default";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "es"])];
      xkb-options = [];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      clock-format = "24h";
      clock-show-seconds = false;
      clock-show-weekday = false;
      color-scheme = "default";
      cursor-size = 22;
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "JetBrains Mono 12";
      font-name = "JetBrains Mono 11";
      gtk-theme = "Tokyonight-Dark-BL";
      icon-theme = "candy-icons";
      monospace-font-name = "JetBrains Mono 11";
      show-battery-percentage = true;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/media-handling" = {
      autorun-never = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = ["org-gnome-epiphany" "org-gnome-settings" "org-gnome-nautilus" "org-gnome-console" "gnome-about-panel" "brave-browser" "gnome-power-panel" "vesktop" "audacity" "org-keepassxc-keepassxc" "org-kde-kdeconnect-daemon" "org-kde-kdeconnect-app" "org-gnome-texteditor" "org-gnome-shell-extensions-gsconnect" "android-studio" "ryujinx" "modrinth-app" "vicinae" "davinci-resolve" "org-gnome-baobab" "gimp" "com-mitchellh-ghostty" "org-gnome-shell-extensions-gsconnect-preferences"];
    };

    "org/gnome/desktop/notifications/application/android-studio" = {
      application-id = "android-studio.desktop";
    };

    "org/gnome/desktop/notifications/application/audacity" = {
      application-id = "audacity.desktop";
    };

    "org/gnome/desktop/notifications/application/brave-browser" = {
      application-id = "brave-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/com-mitchellh-ghostty" = {
      application-id = "com.mitchellh.ghostty.desktop";
    };

    "org/gnome/desktop/notifications/application/davinci-resolve" = {
      application-id = "davinci-resolve.desktop";
    };

    "org/gnome/desktop/notifications/application/gimp" = {
      application-id = "gimp.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-about-panel" = {
      application-id = "gnome-about-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/modrinth-app" = {
      application-id = "Modrinth App.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-epiphany" = {
      application-id = "org.gnome.Epiphany.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect-preferences" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.Preferences.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
      application-id = "org.gnome.TextEditor.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-kdeconnect-app" = {
      application-id = "org.kde.kdeconnect.app.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-kdeconnect-daemon" = {
      application-id = "org.kde.kdeconnect.daemon.desktop";
    };

    "org/gnome/desktop/notifications/application/org-keepassxc-keepassxc" = {
      application-id = "org.keepassxc.KeePassXC.desktop";
    };

    "org/gnome/desktop/notifications/application/ryujinx" = {
      application-id = "Ryujinx.desktop";
    };

    "org/gnome/desktop/notifications/application/vesktop" = {
      application-id = "vesktop.desktop";
    };

    "org/gnome/desktop/notifications/application/vicinae" = {
      application-id = "vicinae.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      disable-while-typing = false;
      natural-scroll = false;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/hwb86w0jz4mlzb5frl480k299ny0mr5y-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [];
      sort-order = ["org.gnome.Epiphany.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Calculator.desktop" "page.kramo.Cartridges.desktop" "org.gnome.Calendar.desktop" "org.gnome.Characters.desktop" "org.gnome.clocks.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Weather.desktop"];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      begin-move = [];
      close = ["<Super>q"];
      maximize = [];
      switch-applications = ["<Alt>Tab"];
      switch-applications-backward = ["<Shift><Alt>Tab"];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-last = [];
      toggle-fullscreen = ["F11"];
      toggle-maximized = ["<Super>m"];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:close";
    };

    "org/gnome/eog/ui" = {
      sidebar = false;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = true;
      window-size = mkTuple [1920 1048];
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "disks";
      maximized = true;
      show-dependencies = false;
      show-whose-processes = "user";
      window-height = 720;
      window-width = 800;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-26-visible = false;
      col-26-width = 0;
      columns-order = [0 12 1 2 3 4 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26];
      sort-col = 0;
      sort-order = 1;
    };

    "org/gnome/maps" = {
      last-viewed-location = [40.317278024363915 (-3.754970732049486)];
      map-type = "MapsVectorSource";
      transportation-type = "pedestrian";
      window-maximized = true;
      zoom-level = 16;
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "medium";
    };

    "org/gnome/nautilus/preferences" = {
      migrated-gtk-settings = true;
      show-create-link = true;
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [890 550];
      initial-size-file-chooser = mkTuple [890 550];
      maximized = true;
    };

    "org/gnome/nm-applet/eap/5b56895b-1b7d-4eaa-b503-0ec9df27c1dd" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/b367c5cb-d268-4cc9-9847-45397acb9075" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/orca/default/metadata" = {
      display-name = "Default";
      internal-name = "default";
    };

    "org/gnome/papers" = {
      night-mode = false;
    };

    "org/gnome/papers/default" = {
      annot-color = "yellow";
      continuous = true;
      dual-page = false;
      dual-page-odd-left = false;
      enable-spellchecking = true;
      eraser-mode-objects = "true";
      highlight-color = "yellow";
      highlight-stroke = 2.0;
      pen-color = "blue";
      pen-stroke = 1.0;
      show-sidebar = true;
      sizing-mode = "automatic";
      text-color = "blue";
      window-height = 1048;
    };

    "org/gnome/polari" = {
      window-maximized = true;
    };

    "org/gnome/portal/filechooser/Ryujinx" = {
      last-folder-path = "/home/enzo/Documents/Games/roms/switch";
    };

    "org/gnome/portal/filechooser/app/drey/Warp" = {
      last-folder-path = "/home/enzo/Pictures/Images";
    };

    "org/gnome/portal/filechooser/io/gitlab/adhami3310/Converter" = {
      last-folder-path = "/etc/nixos/home/assets";
    };

    "org/gnome/portal/filechooser/md/Obsidian" = {
      last-folder-path = "/home/enzo/Documents/notas-obsidian";
    };

    "org/gnome/portal/filechooser/org/chromium/Chromium" = {
      last-folder-path = "/home/enzo/Downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/TextEditor" = {
      last-folder-path = "/home/enzo/Downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/World/PikaBackup" = {
      last-folder-path = "/home/enzo/source";
    };

    "org/gnome/portal/filechooser/steam" = {
      last-folder-path = "/home/enzo/Documents/Games/Mindustry";
    };

    "org/gnome/portal/filechooser/surface-transient" = {
      last-folder-path = "/home/enzo/Documents/Games/roms/switch";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/housekeeping" = {
      donation-reminder-last-shown = mkInt64 1787139624345004;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      control-center = ["<Super>x"];
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"];
      logout = [];
      www = ["<Super>b"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "ghostty";
      name = "ghostty";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>f";
      command = "nautilus";
      name = "file browser";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>i";
      command = "obsidian";
      name = "obsidian";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>ntilde";
      command = "keepassxc";
      name = "keepassxc";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Super>c";
      command = "vesktop";
      name = "vesktop";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
      binding = "<Super>d";
      command = "vicinae toggle";
      name = "vicinae";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };

    "org/gnome/settings-daemon/plugins/sharing/gnome-user-share-webdav" = {
      enabled-connections = ["5b56895b-1b7d-4eaa-b503-0ec9df27c1dd"];
    };

    "org/gnome/settings-daemon/plugins/sharing/rygel" = {
      enabled-connections = ["5b56895b-1b7d-4eaa-b503-0ec9df27c1dd"];
    };

    "org/gnome/shell" = {
      command-history = ["autoclicker-toggle" "impala" "ghostty -e wiremix"];
      disable-user-extensions = false;
      disabled-extensions = ["workspace-bar@jguece"];
      enabled-extensions = ["appindicatorsupport@rgcjonas.gmail.com" "lan-ip-address@mrhuber.com" "gsconnect@andyholmes.github.io" "caffeine@patapon.info" "media-keys@mafflin" "system-monitor-panel@naimur" "ResourceBuzzLite@hridoybuzz.dev" "Resource_Monitor@Ory0n" "emailmonitor@j-rambo.github.io" "syncthing@gnome.2nv2u.com" "top-bar-organizer@julian.gse.jsts.xyz" "openbar@neuromorph"];
      favorite-apps = [];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "50.4";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/caffeine" = {
      cli-toggle = false;
      indicator-position-max = 4;
    };

    "org/gnome/shell/extensions/flypie" = {
      menu-configuration = "[{\"name\":\"Example Menu\",\"icon\":\"flypie-symbolic-#46a\",\"shortcut\":\"<Primary>space\",\"centered\":false,\"id\":0,\"children\":[{\"name\":\"Sound\",\"icon\":\"flypie-multimedia-symbolic-#c86\",\"children\":[{\"name\":\"Mute\",\"icon\":\"flypie-multimedia-mute-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioMute\",\"angle\":-1},{\"name\":\"Play / Pause\",\"icon\":\"flypie-multimedia-playpause-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioPlay\",\"angle\":-1},{\"name\":\"Next Title\",\"icon\":\"flypie-multimedia-next-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioNext\",\"angle\":90},{\"name\":\"Previous Title\",\"icon\":\"flypie-multimedia-previous-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioPrev\",\"angle\":270}],\"type\":\"CustomMenu\",\"data\":{},\"angle\":-1},{\"name\":\"Favorites\",\"icon\":\"flypie-menu-favorites-symbolic-#da3\",\"type\":\"Favorites\",\"data\":{},\"angle\":-1},{\"name\":\"Next Workspace\",\"icon\":\"flypie-go-right-symbolic-#6b5\",\"type\":\"Shortcut\",\"data\":{\"shortcut\":\"<Control><Alt>Right\"},\"angle\":-1},{\"name\":\"Maximize Window\",\"icon\":\"flypie-window-maximize-symbolic-#b68\",\"type\":\"Shortcut\",\"data\":\"<Alt>F10\",\"angle\":-1},{\"name\":\"Fly-Pie Settings\",\"icon\":\"flypie-menu-system-symbolic-#3ab\",\"type\":\"Command\",\"data\":\"gnome-extensions prefs flypie@schneegans.github.com\",\"angle\":-1},{\"name\":\"Close Window\",\"icon\":\"flypie-window-close-symbolic-#a33\",\"type\":\"Shortcut\",\"data\":\"<Alt>F4\",\"angle\":-1},{\"name\":\"Previous Workspace\",\"icon\":\"flypie-go-left-symbolic-#6b5\",\"type\":\"Shortcut\",\"data\":{\"shortcut\":\"<Control><Alt>Left\"},\"angle\":-1},{\"name\":\"Running Apps\",\"icon\":\"flypie-menu-running-apps-symbolic-#65a\",\"type\":\"RunningApps\",\"data\":{\"activeWorkspaceOnly\":false,\"appGrouping\":true,\"hoverPeeking\":true,\"nameRegex\":\"\"},\"angle\":-1}],\"type\":\"CustomMenu\",\"data\":{}}]";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = ["c0b0c51d30f941608c3aa195c5e43211" "7a5b479c4c3f4082acc761ca3546fd53"];
      discoverable = true;
      missing-openssl = false;
      name = "nixos";
    };

    "org/gnome/shell/extensions/gsconnect/device/7a5b479c4c3f4082acc761ca3546fd53" = {
      incoming-capabilities = ["kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.digitizer" "kdeconnect.digitizer.session" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      last-connection = "lan://192.168.0.13:1716";
      name = "arch-yago";
      outgoing-capabilities = ["kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      supported-plugins = ["battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony"];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/c0b0c51d30f941608c3aa195c5e43211" = {
      certificate-pem = "-----BEGIN CERTIFICATE-----nMIIBnjCCAUSgAwIBAgIUZT9bTkhEnkXaOqvzrY3c7iv2myMwCgYIKoZIzj0EAwQwnTzEpMCcGA1UEAwwgYzBiMGM1MWQzMGY5NDE2MDhjM2FhMTk1YzVlNDMyMTExDDAKnBgNVBAoMA0tERTEUMBIGA1UECwwLS0RFIENvbm5lY3QwHhcNMjUwODE5MTgxNTMwnWhcNMzYwODE2MTgxNTMwWjBPMSkwJwYDVQQDDCBjMGIwYzUxZDMwZjk0MTYwOGMznYWExOTVjNWU0MzIxMTEMMAoGA1UECgwDS0RFMRQwEgYDVQQLDAtLREUgQ29ubmVjndDBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABIdoeS4Dwe4hYYKKKUXopfzqOZJSnf6ClrrelNfv7YgaEMeyFXRFaXFWrEYJCRfdWyL+EQCizoitA7cofb0ZAMwswCgYInKoZIzj0EAwQDSAAwRQIgPGj1E8y8A24dKIB6+Sn/68D9MGTtt+UCtO4k1B98C78CnIQC9YL05ZbJOQcfyQfuK+R8WiRhnj4JQdr4VxnyLxHIMaA==n-----END CERTIFICATE-----n";
      incoming-capabilities = ["kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.digitizer" "kdeconnect.digitizer.session" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      last-connection = "lan://192.168.0.16:1716";
      name = "nixos";
      outgoing-capabilities = ["kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request"];
      paired = true;
      supported-plugins = ["battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony"];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/c0b0c51d30f941608c3aa195c5e43211/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/c0b0c51d30f941608c3aa195c5e43211/plugin/notification" = {
      applications = ''
        {"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Events and Tasks Reminders":{"iconName":"org.gnome.Evolution-alarm-notify","enabled":true},"Pika Backup":{"iconName":"org.gnome.World.PikaBackup","enabled":true},"Zenity":{"iconName":"application-x-executable","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Online Accounts":{"iconName":"org.gnome.goa-daemon-symbolic","enabled":true},"Ghostty":{"iconName":"com.mitchellh.ghostty","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Color Management":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Pika Backup Monitor":{"iconName":"org.gnome.World.PikaBackup","enabled":true},"vesktop":{"iconName":"","enabled":true}}
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/c0b0c51d30f941608c3aa195c5e43211/plugin/share" = {
      receive-directory = "/home/enzo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [878 550];
    };

    "org/gnome/shell/extensions/openbar" = {
      default-font = "Sans 12";
    };

    "org/gnome/shell/extensions/resource-monitor" = {
      cpucolors = ["0 0.14901961386203766 0.6352941393852234 0.4117647111415863" "20 0.34117648005485535 0.8901960849761963 0.5372549295425415" "65 0.9647058844566345 0.8274509906768799 0.1764705926179886" "80 1 0.47058823704719543 0" "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"];
      cpufrequencycolors = [];
      cpufrequencystatus = false;
      cpuloadaveragecolors = [];
      cpuloadaveragestatus = false;
      cpurendermode = "precise";
      cpustatus = true;
      customleftclickstatus = "resources";
      diskdevicesdisplayall = true;
      diskdeviceslist = [
        ''
          {"version":2,"type":"disk","device":"/dev/nvme0n1p2","stableId":"/dev/disk/by-uuid/bd0f3464-e7ce-4c0a-8564-de87eacd1702","mountPoint":"/","stats":false,"space":true,"displayName":"z"}
        ''
        ''
          {"version":2,"type":"disk","device":"/dev/nvme0n1p2","stableId":"/dev/disk/by-uuid/bd0f3464-e7ce-4c0a-8564-de87eacd1702","mountPoint":"/nix/store","stats":false,"space":false,"displayName":"/dev/nvme0n1p2"}
        ''
        ''
          {"version":2,"type":"disk","device":"/dev/nvme0n1p1","stableId":"/dev/disk/by-uuid/4342-37A9","mountPoint":"/boot","stats":false,"space":false,"displayName":"/dev/nvme0n1p1"}
        ''
        ''
          {"version":2,"type":"disk","device":"/dev/nvme0n1","stableId":"/dev/disk/by-id/nvme-Micron_MTFDKCD512QGN-1BN1AABLA_25465476450F","mountPoint":"","stats":false,"space":false,"displayName":"/dev/nvme0n1"}
        ''
        ''
          {"version":2,"type":"disk","device":"/dev/nvme0n1p3","stableId":"/dev/disk/by-uuid/cb242bc3-1021-4631-9a0f-315a50d4a1e1","mountPoint":"","stats":false,"space":false,"displayName":"/dev/nvme0n1p3"}
        ''
      ];
      diskshowdevicename = true;
      diskspacecolors = ["0 0.8784313797950745 0.10588235408067703 0.1411764770746231" "15 1 0.47058823704719543 0" "30 0.9647058844566345 0.8274509906768799 0.1764705926179886" "50 0.18039216101169586 0.7607843279838562 0.4941176474094391"];
      diskspacemonitor = "used";
      diskspacestatus = true;
      diskspaceunit = "numeric";
      diskstatscolors = ["0 0.8784313725490196 0.10588235294117647 0.1411764705882353"];
      diskstatsstatus = false;
      diskstatsunitmeasure = "auto";
      displaymode = "primary";
      gpucolors = ["65 0.9647058844566345 0.8274509906768799 0.1764705926179886" "80 1 0.47058823704719543 0" "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"];
      gpudeviceslist = [
        ''
          {"version":2,"type":"gpu","device":"amd:card2","name":"AMD GPU 0x1681","usage":true,"memory":false,"displayName":"GPU"}
        ''
      ];
      gpumemorycolors = [];
      gpumemorydecimals = 1;
      gpustatus = true;
      iconsstatus = false;
      itemsposition = ["cpu" "gpu" "ram" "swap" "stats" "space" "eth" "wlan"];
      leftclickstatus = "resources";
      netautohidestatus = false;
      netethcolors = [];
      netethstatus = false;
      netunitmeasure = "auto";
      netwlancolors = [];
      netwlanstatus = false;
      ramalert = true;
      ramalertthreshold = 4;
      ramcolors = ["0 0.14901961386203766 0.6352941393852234 0.4117647111415863" "4 0.34117648005485535 0.8901960849761963 0.5372549295425415" "8 0.9647058844566345 0.8274509906768799 0.1764705926179886" "12 1 0.47058823704719543 0" "15 0.8784313797950745 0.10588235408067703 0.1411764770746231"];
      ramstatus = true;
      ramunit = "numeric";
      rightclickstatus = true;
      swapalert = true;
      swapalertthreshold = 4;
      swapcolors = ["65 0.9647058844566345 0.8274509906768799 0.1764705926179886" "80 1 0.47058823704719543 0" "92 0.8784313797950745 0.10588235408067703 0.1411764770746231"];
      swapstatus = false;
      swapunit = "numeric";
      swapwidth = 0;
      thermalcpucolors = [];
      thermalcputemperaturedeviceslist = [
        ''
          {"version":2,"type":"thermal-cpu","name":"k10temp: Tctl","monitor":true,"path":"/sys/class/hwmon/hwmon3/temp1_input"}
        ''
      ];
      thermalcputemperaturestatus = true;
      thermalcputemperaturewidth = 0;
      thermalgpucolors = [];
      thermalgputemperaturedeviceslist = [
        ''
          {"version":2,"type":"thermal-gpu","device":"amd:card2","name":"AMD GPU 0x1681","monitor":true}
        ''
      ];
      thermalgputemperaturestatus = true;
    };

    "org/gnome/shell/extensions/top-bar-organizer" = {
      center-box-order = ["dateMenu"];
      hide = [];
      left-box-order = ["activities"];
      right-box-order = ["/org/gnome/Shell/Extensions/GSConnect/Device/6212c78c4de34ae7b1258632c46093f9" "/org/gnome/Shell/Extensions/GSConnect/Device/7a5b479c4c3f4082acc761ca3546fd53" "/org/gnome/Shell/Extensions/GSConnect/Device/c0b0c51d30f941608c3aa195c5e43211" "Resource_Monitor@Ory0n-primary-0" "lan-ip-address-indicator" "screenRecording" "screenSharing" "dwellClick" "a11y" "keyboard" "quickSettings"];
      show = [];
    };

    "org/gnome/shell/keybindings" = {
      show-screen-recording-ui = ["<Shift><Alt>Print"];
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-7 = [];
      toggle-application-view = ["<Super>a"];
      toggle-message-tray = ["<Super>v"];
      toggle-overview = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1788453285;
      first-run = false;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      selected-color = mkTuple [true 1.0 1.0 1.0 1.0];
    };

    "org/gtk/gtk4/settings/emoji-chooser" = {
      recently-used-emoji = [(mkTuple [(mkTuple [[(mkUint32 10004) 65039] "check mark" "check mark" ["check" "checked" "checkmark" "done" "heavy" "mark" "tick" "\10003"] ["check" "checked" "checkmark" "done" "heavy" "mark" "tick" "\10003"] (mkUint32 8)]) (mkUint32 0)]) (mkTuple [(mkTuple [[128077 127995] "thumbs up" "thumbs up" ["+1" "good" "hand" "like" "thumb" "up" "yes"] ["+1" "good" "hand" "like" "thumb" "up" "yes"] 1]) 0])];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };

    "org/gtk/settings/color-chooser" = {
      selected-color = mkTuple [true 1.0 1.0 1.0 1.0];
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "24h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 189;
      sort-column = "type";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [26 23];
      window-size = mkTuple [1203 902];
    };

    "page/kramo/Cartridges" = {
      auto-import = true;
      cover-launches-game = true;
      desktop = true;
      flatpak-user-location = "/home/enzo/.local/share/flatpak";
      retroarch-location = "/home/enzo/.config/retroarch";
      sgdb = true;
      sgdb-key = "6716eea7a8a4586a0093298282615a64";
      sgdb-prefer = true;
      steam-location = "/home/enzo/.steam/steam";
    };

    "page/kramo/Cartridges/State" = {
      is-maximized = true;
      show-sidebar = false;
      sort-mode = "last_played";
      steam-limiter-tokens-history = "[1788449912.094165, 1788449927.4660656, 1788449927.4695482, 1788449927.4729114, 1788449927.4756386]";
    };

    "re/sonny/Junction" = {
      show-app-names = true;
    };
  };
}
