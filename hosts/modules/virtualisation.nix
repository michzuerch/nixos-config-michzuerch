{pkgs, ...}: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
    libvirtd = {
      enable = true;
      allowedBridges = [
        "nm-bridge"
        "virbr0"
      ];
      qemu = {
        runAsRoot = false;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
    waydroid.enable = true;
  };

  users.extraGroups = {
    vboxusers.members = ["michzuerch"];
    kvm.members = ["michzuerch"];
    libvirtd.members = ["michzuerch"];
  };

  environment.systemPackages = with pkgs; [
    consul
    distrobox
    boxbuddy
    hashi-ui
    nomad-driver-podman
    nomad
    podman-compose
    podman-desktop
    podman-tui
    #terraform
    openstackclient
    opentofu
    virt-manager
    virt-viewer
    wander
    spice
    spice-gtk
    spice-protocol
    swtpm
    virglrenderer
    win-virtio
    win-spice
    adwaita-icon-theme
  ];
  environment.variables = {
    DOCKER_HOST = "unix:///var/run/podman/podman.sock";
  };
}
