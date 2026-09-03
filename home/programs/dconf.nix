{ config, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/shell" = {
        # disable-user-extensions = true; # Optionally disable user extensions entirely
        enabled-extensions = [
          "flypie@schneegans.github.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "gsconnect@andyholmes.github.io"
          "lan-ip-address@mrhuber.com"
          "workspace-bar@jguece"
        ];
      };

      # Configure individual extensions
     #"org/gnome/shell/extensions/blur-my-shell" = {
     #  brightness = 0.75;
     #  noise-amount = 0;
     #};
    };
  };
}
