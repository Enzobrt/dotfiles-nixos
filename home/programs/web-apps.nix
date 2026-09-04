let
  browser = "brave";
in {
  xdg.desktopEntries.track-toggl = {
    name = "Track Toggl";
    exec = "${browser} --app=https://track.toggl.com/timer";
    terminal = false;
    icon = ../assets/toggl.svg;
  };
}
