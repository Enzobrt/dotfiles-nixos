{
  config,
  lib,
  pkgs,
  ...
}: let
  rrBase = "/home/enzo/Documents/Games/roms/wii";
  rrConfigDir = rrBase + "/Config";
  homeDir = config.home.homeDirectory;
  profileDir = homeDir + "/.config/dolphin-emu/Profiles/Wiimote";
  marioKartProfile = profileDir + "/mario-kart.ini";
in {
  # WheelWizard launches Retro Rewind with `dolphin-emu -u <roms/wii>`, so Dolphin
  # reads its config from <roms/wii>/Config instead of the normal ~/.config/dolphin-emu.
  # A symlinked Config dir gets destroyed and recreated with defaults by Dolphin, so this
  # is a real directory whose controller config is (re)derived from the mario-kart profile
  # on every rebuild: Retro Rewind uses mario-kart, forever.
  home.activation.dolphinRetroRewindController = lib.mkAfter ''
    # Dolphin replaces a symlinked Config dir with a fresh default one; ensure a real dir.
    if [ -L "${rrConfigDir}" ]; then
      rm -f "${rrConfigDir}"
    fi
    mkdir -p "${rrConfigDir}/Profiles/Wiimote"

    if [ -f "${marioKartProfile}" ]; then
      # Active controller config: [Wiimote1] = mario-kart mapping, others = mouse defaults.
      {
        printf '[Wiimote1]\n'
        sed '1d' "${marioKartProfile}"
        printf '\n[Wiimote2]\nDevice = XInput2/0/Virtual core pointer\n\n[Wiimote3]\nDevice = XInput2/0/Virtual core pointer\n\n[Wiimote4]\nDevice = XInput2/0/Virtual core pointer\n\n[BalanceBoard]\nDevice = XInput2/0/Virtual core pointer\n'
      } > "${rrConfigDir}/WiimoteNew.ini"
      cp -f "${marioKartProfile}" "${rrConfigDir}/Profiles/Wiimote/mario-kart.ini"
      rm -f "${rrConfigDir}/Profiles/Wiimote/wii-controller.ini"
      echo "dolphin: wrote mario-kart controller config for Retro Rewind"
    else
      echo "dolphin: WARNING ${marioKartProfile} not found; keeping existing RR controller config"
    fi
  '';
}
