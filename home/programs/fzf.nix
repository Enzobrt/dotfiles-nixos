{colors, ...}: {
  programs.fzf = {
    enable = true;

    enableBashIntegration = true;

    colors = {
      fg = colors.fg;
      bg = colors.bg;

      "fg+" = colors.fg;
      "bg+" = colors.bgHighlight;

      hl = colors.blue;
      "hl+" = colors.cyan;

      info = colors.purple;
      prompt = colors.blue;
      pointer = colors.magenta;
      marker = colors.green;

      spinner = colors.cyan;
      header = colors.comment;
    };
  };
}
