{
  config,
  pkgs,
  colors,
  ...
}: {
  imports = [
    # Import things here
    ./packages.nix
    ./theme.nix

    ./flatpaks.nix

    ./programs/dconf.nix
    ./programs/services.nix
    ./programs/bash.nix
    ./programs/xdg.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/autostart.nix

    ./programs/neovim.nix
    ./programs/ghostty.nix
    ./programs/starship.nix
    ./programs/eww.nix
    ./programs/bat.nix
    ./programs/fzf.nix
    ./programs/btop.nix
    ./programs/vicinae.nix
    #./programs/vesktop.nix # No usar, hace que tengas que volver a configurar vesktop
    ./programs/syncthing.nix
    ./programs/kdeconnect.nix
    ./programs/brave.nix
  ];

  home.username = "enzo";
  home.homeDirectory = "/home/enzo";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  # Default appps
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    GIT_EDITOR = "nvim";
  };
}
