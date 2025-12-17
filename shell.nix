{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    packages = with pkgs; [
      age
      sops
      rops
      git
      gh
      yazi
      ripgrep-all
      jq
      pciutils
      tree
      fastfetch
      gtop
      sbctl
    ];
    # strictDeps = true;
    #
    # nativeBuildInputs = [
    #   cargo
    #   rustc
    #
    #   (rustfmt.override {asNightly = true;})
    #   rust-analyzer-unwrapped
    #   clippy
    #   taplo
    #
    #   lldb
    #   yaml-language-server
    #   cargo-nextest
    #
    #   nix-output-monitor
    # ];
    #
    # buildInputs = lib.optionals stdenv.isDarwin [
    #   libiconv
    # ];

    env = {
      NH_NOM = "1";
      NH_LOG = "nh=trace";
      # RUST_SRC_PATH = "${rustPlatform.rustLibSrc}";
    };
  }
