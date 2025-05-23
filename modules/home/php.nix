{ config, pkgs, ... }:

let
  php = pkgs.phpPackages.php80;  # oder php81/php82 je nach Präferenz
in
{
  # 1. Enable nginx + PHP-FPM
  services.nginx = {
    enable = true;
    virtualHosts."example.com" = {
      root = "/var/www/example";
      index = "index.php";
      extraConfig = ''
        location ~ \.php$ {
          fastcgi_pass   unix:/run/phpfpm.sock;
          fastcgi_index  index.php;
          include        fastcgi_params;
          fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
      '';
    };
  };

  services.phpfpm = {
    enable = true;
    poolConfigs = {
      www = {
        user = "nginx";
        group = "nginx";
        listen = "/run/phpfpm.sock";
      };
    };
    package = php;
    # Activate necessary extensions
    extensions = with php.extensions; [
      pdo_mysql
      pdo_sqlite
      mbstring
      opcache
      fileinfo
    ];
  };

  # 2a. MariaDB (für MySQL-Workloads)
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    initialScript = ''
      CREATE DATABASE IF NOT EXISTS example CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
      CREATE USER IF NOT EXISTS 'example'@'localhost' IDENTIFIED BY 'securePwd';
      GRANT ALL ON example.* TO 'example'@'localhost';
      FLUSH PRIVILEGES;
    '';
  };

  # 2b. (Alternative) SQLite braucht keine Service-Konfiguration

  # 3. Datei-Rechte & Web-Root
  users.groups.www = { };
  users.users.nginx = {
    group = "www";
    home = "/var/www";
    createHome = false;
  };
  environment.etc."/var/www/example".source = /path/to/dein/php-app;

  # 4. Composer global (für CLI)
  environment.systemPackages = with pkgs; [
    composer
    nginx
    mariadb
    sqlite
  ];

  # 5. Security & Performance
  services.phpfpm.settings = {
    pm = "dynamic";
    pm.max_children = 30;
    pm.start_servers = 5;
    pm.min_spare_servers = 2;
    pm.max_spare_servers = 10;
    opcache.enable = true;
    opcache.memory_consumption = 128;
    opcache.validate_timestamps = true;
    opcache.revalidate_freq = 2;
  };

  # 6. Future-Proofing
  nix.package = pkgs.nixUnstable;      # Flakes-Ready
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

