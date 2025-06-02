{ config, pkgs, ... }:

let
  php = pkgs.php;
in
{

  # SQLite3 als CLI Tool, falls du es brauchst
  home.packages = [
    pkgs.sqlite
  ];

  # User und Gruppen für nginx, falls noch nicht existieren
  
}

