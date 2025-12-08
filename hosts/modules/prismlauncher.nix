{inputs, ...}: {
  environment.systemPackages = [inputs.prismlauncher.packages.x86_64-linux.prismlauncher];
}
