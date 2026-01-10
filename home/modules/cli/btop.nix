{pkgs, ...}: {
  programs.btop = {
    enable = true;

    settings = {
      theme_background = false;
      update_ms = 500;
      vim_keys = true;
      mem_graphs = false;
      proc_per_core = true;
      rounded_corners = false;
      disks_filter = "";
    };
  };
  home.packages = with pkgs; [nvtopPackages.intel];
}
