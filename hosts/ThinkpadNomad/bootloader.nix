{pkgs, ...}: {
  boot = {
    bootspec.enable = true;
    tmp.cleanOnBoot = true;
    consoleLogLevel = 0;
    initrd = {
      enable = true;
      systemd.enable = true;
      supportedFilesystems = ["ext4"];
      verbose = false;
      availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod"];
    };
    kernelModules = ["kvm-intel"];
    kernelParams = [
      "quiet"
      "splash"
      "systemd.show_status=auto"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
      "plymouth.use-simpledrm"
    ];

    extraModulePackages = [];
    loader = {
      timeout = 10;
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    };
  };
}
