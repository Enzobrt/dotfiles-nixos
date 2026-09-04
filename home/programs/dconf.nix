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
          "appindicatorsupport@rgcjonas.gmail.com"
          "lan-ip-address@mrhuber.com"
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
