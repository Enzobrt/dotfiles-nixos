{colors, ...}: {
  programs.alacritty = {
    enable = true;

    theme = "tokyo_night_storm";

    settings = {
      window = {
        padding = {
          x = 0;
          y = 0;
        };
        opacity = 0.5;
        decorations = "none";
        startup_mode = "Maximized";
      };

      font = {
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono NF";
          style = "Bold";
        };
        size = 11.0;
      };
    };
  };
}
