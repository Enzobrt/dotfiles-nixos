{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Enzobrt";
        email = "BrotonEnzo@gmail.com";
      };
      safe.directory = "/etc/nixos";
      init.defaultBranch = "main";
    };
  };
}
