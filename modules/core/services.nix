{ config, pkgs, ... }:

{
  services = {
    gvfs.enable = true;

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

    fstrim.enable = true;

    logind.extraConfig = ''
      # don’t shutdown when power button is short-pressed
      HandlePowerKey=ignore
    '';
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

