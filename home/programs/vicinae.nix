{ pkgs, vicinae, vicinae-extensions, ... }:

{
  programs.vicinae = {
    enable = true;

    package = vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default;

    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };

    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      favicon_service = "twenty";
      search_files_in_root = true;

      font.normal = {
        size = 12;
        family = "JetBrains Mono";
      };

      theme = {
        light = {
          name = "vicinae-light";
          icon_theme = "default";
        };
        dark = {
          name = "tokyo-night-storm";
          icon_theme = "default";
        };
      };

      launcher_window.opacity = 0.98;
    };

    extensions =
      with vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system};
      [
        nix
        power-profile
        it-tools
      ];
  };
}
