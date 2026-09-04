{ config, pkgs, ... }:

{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Videos";
    };

    configFile."autostart/vesktop.desktop".source =
      "${pkgs.vesktop}/share/applications/vesktop.desktop";
    configFile."autostart/org.gnome.World.PikaBackup.desktop".source =
      "${pkgs.pika-backup}/share/applications/org.gnome.World.PikaBackup.desktop";
  };
}
