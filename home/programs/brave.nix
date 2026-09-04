{config, ...}: {
  programs.brave = {
    enable = true;
    nativeMessagingHosts = [config.programs.vicinae.package];
  };
}
