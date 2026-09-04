{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      maximize = true;
      background-opacity = 0.8;
      window-decoration = "none";
      title = "Ghostty";

      working-directory = "home/enzo";

      background-image = "/home/enzo/Pictures/wallpaper/green.jpeg";
      background-image-opacity = 0.4;
      background-image-fit = "cover";

      window-padding-balance = true;

      font-size = 11;
      font-family = "JetBrainsMono NF";

      theme = "TokyoNight Storm";

      cursor-style = "block";
      cursor-color = "9ece6a";

      confirm-close-surface = false;

      keybind = [
        "ctrl+f=start_search"

        "ctrl+t=new_split:right"
        "ctrl+0=equalize_splits"
        "ctrl+shift+w=close_surface"

        "alt+shift+down=new_split:down"
        "alt+shift+up=new_split:up"
        "alt+shift+left=new_split:left"
        "alt+shift+right=new_split:right"

        "ctrl+shift+down=goto_split:down"
        "ctrl+shift+up=goto_split:up"
        "ctrl+shift+left=goto_split:left"
        "ctrl+shift+right=goto_split:right"
      ];
    };
  };
}
