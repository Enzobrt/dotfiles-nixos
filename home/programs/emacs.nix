{pkgs, ...}: {
  # programs.emacs = {
  # enable = true;
  # };

  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom-emacs; # Directory containing your config.el
    emacs = pkgs.emacs-pgtk;
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
