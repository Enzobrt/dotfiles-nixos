{pkgs, ...}: {
  systemd.user.services.minecraft-toggl-tracker = {
    Unit = {
      Description = "Minecraft Toggl Tracker";
      After = ["network.target" "eww-daemon.service"];
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "/home/enzo/Documents/Programación/scripts/mc_toggl_track.sh";
      Restart = "always";
      RestartSec = 5;
      Environment = [
        "PATH=/run/current-system/sw/bin:/run/wrappers/bin:/etc/profiles/per-user/enzo/bin"
      ];
    };
  };

  systemd.user.services.eww-daemon = {
    Unit = {
      Description = "Eww daemon";
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${pkgs.eww}/bin/eww daemon";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  systemd.user.services.ydotoold = {
    Unit = {
      Description = "ydotool daemon";
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-path=%t/.ydotool_socket";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
