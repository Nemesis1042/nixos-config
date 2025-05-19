{ inputs, pkgs, ... }:

let
  grimblast = inputs.hypr-contrib.packages.${pkgs.system}.grimblast;
  hyprmag = inputs.hyprmag.packages.${pkgs.system}.hyprmag;
in {
  home.packages = with pkgs; [
    swww
    grimblast
    hyprpicker
    hyprmag
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    direnv
    xdg-utils
    mako
    playerctl
  ];

  xdg = {
    enable = true;
    autostart.enable = true;
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    xwayland.enable = true;
    systemd.enable = true;
  };
}

