{ config, pkgs, ... }:

{
  home-manager.users."${builtins.getEnv "USER"}" = {
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
            <family>monospace</family>
            <prefer><family>Hack Nerd Font</family></prefer>
          </alias>
        </fontconfig>
      '';
    };
  };
}

