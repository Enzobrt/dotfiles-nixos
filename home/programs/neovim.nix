{
  pkgs,
  colors,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    extraPackages = with pkgs; [
      nil
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];
    extraConfig = ''
      set number
      set relativenumber

      set cursorline

      set termguicolors

      set expandtab
      set tabstop=2
      set shiftwidth=2
      set softtabstop=2

      set smartindent

      set ignorecase
      set smartcase

      set clipboard=unnamedplus

      set splitright
      set splitbelow

      set signcolumn=yes

      set updatetime=250

      highlight Normal guibg=${colors.bg}
      highlight NormalFloat guibg=${colors.bgDark}
      highlight FloatBorder guifg=${colors.blue} guibg=${colors.bgDark}
      highlight CursorLine guibg=${colors.bgHighlight}
      highlight LineNr guifg=${colors.comment}
      highlight CursorLineNr guifg=${colors.blue}
    '';
  };

  home.file.".config/nvim/".source = ./nvim;
}
