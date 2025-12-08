{inputs, ...}: {
  environment.systemPackages = [
    inputs.nix-auth.packages.x86_64-linux.default
  ];
}
