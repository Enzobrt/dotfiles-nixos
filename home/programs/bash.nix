{
  programs.bash = {
    enable = true;
    shellAliases = {
      nx-c = "cd /etc/nixos/";
      nx-u = "/home/enzo/Documents/Programación/scripts/nixos-update.sh";
      sc = "cd /home/enzo/Documents/Programación/scripts/";
      prog = "cd ~/Documents/Programación/ && cd '$(find */ -maxdepth 1 -type d | fzf --cycle)'";
      cole = "cd ~/Documents/Cole/ && cd '$(find */ -maxdepth 1 -type d | fzf --cycle)'";
      task = "nvim ~/Documents/notas-obsidian/tasks.md";
      notas = "cd ~/Documents/notas-obsidian/ && nvim '$(find **md  **/*md -type f | fzf --cycle)'";
      empezados = " nvim ~/Documents/notas-obsidian/empezados.md";
    };
    initExtra = ''
      export EDITOR="nvim"
      eval "$(starship init bash)"
    '';
  };
}
