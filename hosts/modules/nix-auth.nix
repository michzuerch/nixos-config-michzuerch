{
  pkgs,
  inputs,
  system,
  ...
}: {
  environment.systemPackages = [
    inputs.nix-auth.packages.${system}.default
  ];
}
