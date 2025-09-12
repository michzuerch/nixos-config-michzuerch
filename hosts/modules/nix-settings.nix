{lib, ...}: {
  nix = {
    channel.enable = false;
    extraOptions = ''
      warn-dirty = false
    '';

    # Build everything from source, dont use nix cache
    # extraOptions = "substitute = false";

    settings = {
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["michzuerch"];
      download-buffer-size = 262144000;
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://cosmic.cachix.org/"
        "https://prismlauncher.cachix.org"
        "https://cachix.cachix.org"
        "https://nixpkgs.cachix.org"
        "https://numtide.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
        "prismlauncher.cachix.org-1:9/n/FGyABA2jLUVfY+DEp4hKds/rwO+SCOtbOkDzd+c="
        "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="
        "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      ];
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "cursor"
          "windsurf"
        ];
      android_sdk.accept_license = true;
    };
    permittedInsecurePackages = ["ventoy-1.1.05" "darktable"];
  };
}
