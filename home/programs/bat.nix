{ config, pkgs, colors, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "TokyoNight";
      pager = "less -FR";
    };
  };
}
