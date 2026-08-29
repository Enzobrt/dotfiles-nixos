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
      url."git@github.com:".insteadOf = [
        "https://github.com/"
        "http://github.com/"
      ];
      core.askPass = "";
      credential.helper = "";
      diff.tool = "nvimdiff";
      difftool.nvimdiff.cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
    };
  };
}
