{
  programs.starship = {
    enable = true;
    presets = [ "nerd-font-symbols" ];
    settings = {
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };
}
