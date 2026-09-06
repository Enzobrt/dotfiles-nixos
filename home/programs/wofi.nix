{
  programs.wofi = {
    enable = true;

    settings = {
      single_window = true;
      hide_on_focus_loss = true;

      location = "bottom";
      yoffset = -80;

      width = 700;
      height = 450;

      show = "drun";
      prompt = "Buscar";
      insensitive = true;
      allow_images = true;
    };

    style = ''
      window {
        background-color: rgba(26, 27, 38, 0.95);
        border: 2px solid #414868;
        border-radius: 16px;
      }

      #input {
        margin: 15px;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background-color: #24283b;
        color: #c0caf5;
      }

      #inner-box {
        margin: 5px 15px 15px 15px;
      }

      #entry {
        padding: 10px;
        border-radius: 10px;
      }

      #entry:selected {
        background-color: #7aa2f7;
        color: #1a1b26;
      }
    '';
  };
}
