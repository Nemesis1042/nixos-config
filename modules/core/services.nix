{ config, pkgs, ... }:

{
  services = {
    gvfs.enable = true;
    openssh.enable = true;
    openssh.settings.PermitRootLogin = "yes";
    openssh.settings.PasswordAuthentication = true;

    printing.enable = true;
    avahi.enable = true;   # For network printer discovery
    avahi.nssmdns4 = true;  # Helps with mDNS (Bonjour)
    printing.drivers = [ pkgs.hplip ];

    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };

    dbus = {
      enable = true;
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
      ];
    };
    blueman.enable = true;
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  systemd.services.set-dynamic-timezone = {
    description = "Set Dynamic Timezone Based on IP";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.set-dynamic-timezone}/bin/set-dynamic-timezone";
    };
  };
}

