{
  services.syncthing = {
    enable = true;
    guiAddress = "0.0.0.0:8384";
    overrideDevices = true;
    overrideFolders = true;

    tray = {
      enable = true;
    };

    settings = {
      devices = {
        movil-z = {
          id = "44OHJTC-ECJ7PNX-ONID3CA-XLALCUO-SHUQO4M-NFWKHMI-MYYRZM6-TMDAHQC";
        };
      };

      folders = {
        keepassxce = {
          path = "~/Documents/keepass/";
          devices = ["movil-z"];
        };
        notas-obsidian = {
          path = "~/Documents/notas-obsidian";
          devices = ["movil-z"];
        };
        music = {
          path = "~/Music";
          devices = ["movil-z"];
        };
        roms = {
          path = "~/Documents/Games/roms";
          devices = ["movil-z"];
          ignorePatterns = [
            "ds"
            "gc"
            "ps*"
            "switch"
            "mount-arkos*"
          ];
        };
      };
    };
  };
}
