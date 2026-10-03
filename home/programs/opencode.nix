{
  programs.opencode = {
    enable = true;
    settings = {
      permission = {
        "*" = "ask";

        read = "allow";
        edit = {
          "*" = "ask";
          "*.env" = "deny";
          "*.env.*" = "deny";
        };

        glob = "allow";
        grep = "allow";
        list = "allow";

        bash = {
          "*" = "ask";
          "git status*" = "allow";
          "git diff*" = "allow";
          "git log*" = "allow";
          "npm test*" = "allow";
          "rm*" = "deny";
          "sudo*" = "deny";
        };

        task = "allow";
        skill = "allow";
        lsp = "allow";

        external_directory = {
          "*" = "ask";
          "/tmp/**" = "allow";
        };

        question = "allow";
        webfetch = "ask";
        websearch = "allow";
        doom_loop = "ask";
        todoread = "allow";
        todowrite = "allow";
      };
    };
  };
}
