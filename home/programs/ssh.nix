{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks."github.com" = {
      host = "github.com";
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/id_ed25519";
      identitiesOnly = true;
      addKeysToAgent = "yes";
    };
  };
}
