{ config, pkgs, colors, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    candy-icons
    bibata-cursors
    nwg-look
  ];

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
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "JetBrains Mono" ];
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
