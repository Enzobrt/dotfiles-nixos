{ colors, ... }:

let
  scssContent = builtins.readFile ./eww/eww.scss;
  yuckContent = builtins.readFile ./eww/eww.yuck;
in

{
  programs.eww = {
    enable = true;
    yuckConfig = yuckContent;
    scssConfig = scssContent;
  };
  home.file.".config/eww/tokyo-night.scss".text = ''
    $bg: ${colors.bg};
    $bg-dark: ${colors.bgDark};
    $bg-highlight: ${colors.bgHighlight};

    $fg: ${colors.fg};
    $fg-dark: ${colors.fgDark};

    $blue: ${colors.blue};
    $cyan: ${colors.cyan};
    $purple: ${colors.purple};
    $magenta: ${colors.magenta};

    $green: ${colors.green};
    $yellow: ${colors.yellow};
    $orange: ${colors.orange};
    $red: ${colors.red};

    $comment: ${colors.comment};
  '';
}
