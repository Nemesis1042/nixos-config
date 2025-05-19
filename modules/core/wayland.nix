{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };
  xdg.portal = {
    enable = true;
    config.common.default = "xdg-desktop-portal-hyprland";
  };
}
