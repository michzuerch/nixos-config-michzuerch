{
  options,
  lib,
  ...
}: {
  imports = [
    ./disko.nix
    ./bootloader.nix
    ./hardware-configuration.nix
    ./local-packages.nix
    ./users.nix
  ];

  networking.hostName = "ElitebookNomad";
  networking.networkmanager.enable = true;
  networking.timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];

  swapDevices = lib.mkForce [];

  services = {
    fstrim = {
      enable = true;
      interval = "weekly";
    };
    smartd = {
      enable = false;
      autodetect = true;
    };
    gvfs.enable = true;
    tumbler.enable = true;
    udev.enable = true;
    libinput.enable = true;

    rpcbind.enable = false;
    nfs.server.enable = false;
  };

  system.stateVersion = "25.11";
}
