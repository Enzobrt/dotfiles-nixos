{ config, pkgs, ... }:

{
  programs.adb.enable = true;

  users.users.enzo.extraGroups = [
    "adbusers"
  ];
}
