{ config, pkgs, ... }:

let
  php = pkgs.php83.withExtensions (exts: [
  pkgs.php83Extensions.mbstring
  pkgs.php83Extensions.curl
]);

in
{

  # SQLite3 als CLI Tool, falls du es brauchst
  home.packages = [
    pkgs.sqlite
  ];

  # User und Gruppen für nginx, falls noch nicht existieren
  
}

