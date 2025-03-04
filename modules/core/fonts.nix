{ config, lib, pkgs, ... }:  
{
  fonts = {
    fontDir.enable = true; # Enable font directory
    packages = with pkgs; [
      #noto-fonts
      #noto-fonts-cjk-sans
      #noto-fonts-emoji
      nerd-fonts.hack
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono

      
    ];
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
}

