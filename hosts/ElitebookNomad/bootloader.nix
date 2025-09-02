{
  pkgs,
  config,
  ...
}: {
  boot = {
    bootspec.enable = true;
    tmp.cleanOnBoot = true;
    consoleLogLevel = 0;
    initrd = {
      enable = true;
      systemd.enable = true;
      verbose = false;
      availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod"];
    };
    kernelModules = ["acpi_call" "v4l2loopback"];
    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
    ];

    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
        v4l2loopback
      ]
      ++ [pkgs.cpupower-gui];

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
