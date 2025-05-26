{ config, pkgs, ... }:

let
  php = pkgs.php;
in
{
  services.phpfpm = {
    enable = true;
    package = php;

    poolConfigs = {
      www = {
        user = "nginx";
        group = "nginx";
        listen = "/run/phpfpm.sock";

        # PHP-FPM Prozess-Manager (pm) Einstellungen
        mode = "dynamic";
	max_children = 30;
  	start_servers = 5;
  	min_spare_servers = 2;
  	max_spare_servers = 10;
      };
    };

    # PHP Extensions
    extensions = with php.extensions; [
      pdo_mysql
      pdo_sqlite
      mbstring
      opcache
      fileinfo
    ];

    # Globale PHP-Einstellungen (php.ini Werte)
    settings = {
      opcache.enable = true;
      opcache.memory_consumption = 128;
      opcache.validate_timestamps = true;
      opcache.revalidate_freq = 2;
    };
  };

  services.nginx = {
    enable = true;

    # Server für PHP-FPM
    virtualHosts = {
      "localhost" = {
        root = "/var/www/html";
        index = "index.php";

        locations."/" = {
          tryFiles = "$uri $uri/ /index.php?$query_string";
        };

        locations."\\.php$" = {
          fastcgi = {
            backend = "unix:/run/phpfpm.sock";
            index = "index.php";
            splitPath = "\\.php$";
          };
        };
      };
    };
  };

  # MariaDB (MySQL) Server aktivieren
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;

    # Passwort für Root User, bitte anpassen!
    rootPassword = "";
  };

  # SQLite3 als CLI Tool, falls du es brauchst
  environment.systemPackages = [
    pkgs.sqlite
  ];

  # User und Gruppen für nginx, falls noch nicht existieren
  users.users.nginx = {
    isSystemUser = true;
    group = "nginx";
    createHome = false;
    description = "nginx web server user";
  };

  users.groups.nginx = {};

  # Firewall-Ports öffnen (optional, falls aktiviert)
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}

