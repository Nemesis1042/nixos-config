{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-gaming.cachix.org"
        "https://hyprland.cachix.org"
        "https://ghostty.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      ];
    };
  };
  nixpkgs = {
    overlays = [ inputs.nur.overlays.default 
     (final: prev: {
      set-dynamic-timezone = prev.writeShellScriptBin "set-dynamic-timezone" ''
        #!${prev.runtimeShell}
        ZONE=$(curl -s https://ipapi.co/timezone)
        if [[ -n "$ZONE" ]]; then
          echo "Setting timezone to $ZONE"
          timedatectl set-timezone "$ZONE"
        else
          echo "Could not determine timezone"
        fi
      '';
    })

    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    set-dynamic-timezone 
  ];

  #time.timeZone = "UTZ";
  services.timesyncd.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
