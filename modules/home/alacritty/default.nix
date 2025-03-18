{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 12; y = 12; };
        opacity = 0.9;
      };

      font = {
        normal.family = "FiraCode Nerd Font";
        size = 13.0;
      };

      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };
      };

      shell.program = "${pkgs.zsh}/bin/zsh";
    };
  };
}

