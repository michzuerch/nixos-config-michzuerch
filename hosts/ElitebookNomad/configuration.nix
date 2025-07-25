{lib, ...}: {
  imports = [
    ./disko.nix
    ./bootloader.nix
    ./hardware-configuration.nix
    ./local-packages.nix
    ./users.nix
  ];

  networking.hostName = "ElitebookNomad";
  networking.networkmanager.enable = true;

  swapDevices = lib.mkForce [];

  system.stateVersion = "25.11";
}
