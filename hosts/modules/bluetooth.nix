{pkgs, ...}: {
  environment.systemPackages = with pkgs; [bluez];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        AutoEnable = true;
        ControllerMode = "dual";
        Experimental = true;
        KernelExperimental = true;
      };
    };
  };
  services.blueman.enable = true;
  systemd.user.services.telephony_client.enable = false;
}
