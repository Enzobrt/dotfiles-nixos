{ config, pkgs, ... }:

{
  systemd.user.services.minecraft-toggl-tracker = {
    Unit = {
      Description = "Minecraft Toggl Tracker";
      After = [ "network.target" ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Service = {
      ExecStart = "/home/enzo/Documents/Programación/scripts/mc_toggl_track.sh";
      Restart = "always";
      RestartSec = 5;
    };
  };

  systemd.user.services.ydotoold = {
    Unit = {
      Description = "ydotool daemon";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-path=%t/.ydotool_socket";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
