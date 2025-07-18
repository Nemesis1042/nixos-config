{ config, pkgs, ... }:

{
  services = {
    gvfs.enable = true;
    openssh.enable = true;
    openssh.permitRootLogin = "no";
    openssh.passwordAuthentication = false;


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
  systemd.services.set-dynamic-timezone = {
    description = "Set Dynamic Timezone Based on IP";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.set-dynamic-timezone}/bin/set-dynamic-timezone";
    };
  };
}

