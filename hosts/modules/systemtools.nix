{pkgs, ...}: {
  programs = {
    partition-manager.enable = true;
  };
  environment.systemPackages = with pkgs; [busybox hydra-check screenkey];
}
