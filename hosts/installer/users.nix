{pkgs, ...}: {
  programs.zsh.enable = true;
  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;
    users.michzuerch = {
      isNormalUser = true;
      initialPassword = "changeme";
      description = "Michi Minimal";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "tss"
        "wireshark"
        "podman"
        "input"
        "audio"
      ];
      openssh.authorizedKeys.keys = [
        #"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILsyEfMjNUlwrf4NG3f6BWpP4uSzCfpC7V5jMqtiLfSQ michzuerch@localhost"
      ];
    };
  };
}
