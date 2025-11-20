{
  config,
  pkgs,
  username,
  ...
}:
{
  virtualisation.docker.enable = true;

  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "docker" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
