{pkgs, ...}: {
  programs.gnome-shell = {
    enable = true;
    extensions = [
      {package = pkgs.gnomeExtensions.appindicator;}
      {package = pkgs.gnomeExtensions.lan-ip-address;}
      {package = pkgs.gnomeExtensions.gsconnect;}
      {package = pkgs.gnomeExtensions.syncthing-indicator;}
      {package = pkgs.gnomeExtensions.caffeine;}
      {package = pkgs.gnomeExtensions.resource-monitor;}
      {package = pkgs.gnomeExtensions.top-bar-organizer;}
    ];
  };
}
