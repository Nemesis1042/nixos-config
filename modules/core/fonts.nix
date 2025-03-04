{ config, lib, pkgs, ... }:

let
  username = builtins.getEnv "USER"; # Get the current user
in
{
  fonts = {
    enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      hack-font
      nerdfonts
    ];
  };

  environment.variables = {
    FONT_FAMILY = "Hack Nerd Font";
    FONT_MONO = "Hack Nerd Font";
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "Hack Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # Automatically use the detected username in Home-Manager
  home-manager.users."${username}" = {
    home.packages = with pkgs; [
      hack-font
      nerdfonts
    ];

    xdg.configFile."fontconfig/fonts.conf".source = pkgs.writeTextFile {
      name = "user-fontconfig";
      text = ''
        <?xml version='1.0'?>
        <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
        <fontconfig>
          <alias>
            <family>

