{lib, ...}: {
  dconf.settings = {
    "org/gnome/shell/extensions/gsconnect" = {
      devices = ["6212c78c4de34ae7b1258632c46093f9"];
      discoverable = true;
      missing-openssl = false;
      name = "nixos";
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = lib.hm.gvariant.mkTuple [878 550];
    };
  };
}
