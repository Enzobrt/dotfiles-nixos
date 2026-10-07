{
  programs.bash = {
    enable = true;
    shellAliases = {
      nx-c = "cd /etc/nixos/";
      nx-u = "/home/enzo/Documents/programacion/scripts/nixos-update.sh";
      sc = "cd /home/enzo/Documents/programacion/scripts/";
      prog = "cd ~/Documents/programacion/ && cd $(find */ -maxdepth 2 -type d | fzf --cycle)";
      cole = "cd ~/Documents/Cole/ && cd $(find */ -maxdepth 2 -type d | fzf --cycle)";
      task = "nvim ~/Documents/notas-obsidian/tasks.md";
      notas = "cd ~/Documents/notas-obsidian/ && nvim $(find **md -type f -maxdepth 2 | fzf --cycle)";
      empezados = " nvim ~/Documents/notas-obsidian/empezados.md";
      chwall = "/home/enzo/Documents/programacion/scripts/wallpaper-switch.sh";
    };
    initExtra = ''
      export EDITOR="nvim"
      eval "$(starship init bash)"
    '';
  };
}
