{ config, pkgs, colors, ... }:

{
  home.packages = with pkgs; [
    ## Fonts
    #nerd-fonts.jetbrains-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    dejavu_fonts


    # Icons
    candy-icons

    # Cursor
    bibata-cursors

    nwg-look
  ];
  
  # wallpaper
  dconf.settings."org/gnome/desktop/background" = {
    picture-uri = "file:///home/enzo/Pictures/wallpaper/Nixos/nixos_pride_pastel.png";
    picture-uri-dark = "file:///home/enzo/Pictures/wallpaper/Nixos/nixos_pride_pastel.png";
    picture-options = "zoom";
  };

  gtk = {
    enable = true;

    colorScheme = "dark";

    theme = {
      name = "Tokyonight-Dark-BL";
      package = pkgs.tokyonight-gtk-theme;
    };

    iconTheme = {
      name = "candy-icons";
      package = pkgs.candy-icons;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 22;
    };

    font = {
      name = "JetBrains Mono";
      size = 11;
    };
  };

  qt = {
    enable = true;

    platformTheme.name = "gtk3";

    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font Mono" ];
      sansSerif = [ "JetBrainsMono Nerd Font" ];
      serif = [ "Noto Serif" ];
    };
  };

  home.sessionVariables = {
    TOKYO_NIGHT_BG = colors.bg;
    TOKYO_NIGHT_BG_DARK = colors.bgDark;
    TOKYO_NIGHT_BG_HIGHLIGHT = colors.bgHighlight;

    TOKYO_NIGHT_FG = colors.fg;
    TOKYO_NIGHT_FG_DARK = colors.fgDark;

    TOKYO_NIGHT_BLUE = colors.blue;
    TOKYO_NIGHT_CYAN = colors.cyan;
    TOKYO_NIGHT_PURPLE = colors.purple;
    TOKYO_NIGHT_MAGENTA = colors.magenta;

    TOKYO_NIGHT_GREEN = colors.green;
    TOKYO_NIGHT_YELLOW = colors.yellow;
    TOKYO_NIGHT_ORANGE = colors.orange;
    TOKYO_NIGHT_RED = colors.red;

    TOKYO_NIGHT_COMMENT = colors.comment;

    GTK_THEME = "Tokyonight-Dark-BL";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "22";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };
}
