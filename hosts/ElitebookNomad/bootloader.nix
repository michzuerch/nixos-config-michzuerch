{
  pkgs,
  config,
  ...
}: {
  systemd.settings.Manager = {DefaultTimeoutStopSec = "10s";};
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
      "boot.shell_on_fail"
    ];

    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
        v4l2loopback
      ]
      ++ [pkgs.cpupower-gui];

    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 10;
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
      };
    };
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    };
  };
}
