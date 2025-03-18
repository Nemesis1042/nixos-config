{config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        dimensions = { columns = 100; lines = 30; };
        padding = { x = 12; y = 12; };
        opacity = 0.9;
        dynamic_padding = true;
        decorations = "full";
        startup_mode = "Windowed";
      };

      font = {
        normal = { family = "FiraCode Nerd Font"; style = "Regular"; };
        bold = { family = "FiraCode Nerd Font"; style = "Bold"; };
        italic = { family = "FiraCode Nerd Font"; style = "Italic"; };
        size = 13.0;
        offset = { x = 0; y = 1; };
        glyph_offset = { x = 0; y = 0; };
      };

      cursor = {
        style = { shape = "Block"; blinking = "Always"; };
        blink_interval = 500;
        unfocused_hollow = true;
      };

      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };
        cursor = {
          text = "#1e1e2e";
          cursor = "#f5e0dc";
        };
        selection = {
          text = "#1e1e2e";
          background = "#f5c2e7";
        };
      };

      terminal.shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = ["--login"];
      };

      mouse = {
        hide_when_typing = true;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      live_config_reload = true;
      env.TERM = "xterm-256color";

      key_bindings = [
        { key = "V"; mods = "Control|Shift"; action = "Paste"; }
        { key = "C"; mods = "Control|Shift"; action = "Copy"; }
        { key = "N"; mods = "Control|Shift"; action = "SpawnNewInstance"; }
        { key = "Plus"; mods = "Control"; action = "IncreaseFontSize"; }
        { key = "Minus"; mods = "Control"; action = "DecreaseFontSize"; }
        { key = "Key0"; mods = "Control"; action = "ResetFontSize"; }
      ];
    };
  };
}

