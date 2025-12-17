{
  description = "nixos michzuerch december 2025";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:NixOS/nixos-hardware/master";
    nix-auth.url = "github:numtide/nix-auth";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nsearch = {
      url = "github:niksingh710/nsearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-desktop = {
      url = "github:k3d3/claude-desktop-linux-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-bitcoin = {
      url = "github:fort-nix/nix-bitcoin/release";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # emacs-overlay = {
    #   url = "github:nix-community/emacs-overlay";
    #   flake = false;
    # };
    # doom-emacs = {
    #   url = "github:nix-community/nix-doom-emacs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.emacs-overlay.follows = "emacs-overlay";
    # };
    # nix-doom-emacs-unstraightened = {
    #   url = "github:marienz/nix-doom-emacs-unstraightened";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-formatter-pack,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // inputs.home-manager.lib;

    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forAllSystems = function:
      nixpkgs.lib.genAttrs supportedSystems (system: function nixpkgs.legacyPackages.${system});

    forEachSystem = nixpkgs.lib.genAttrs supportedSystems;

    formatterPackArgsPerSystem = forEachSystem (system: {
      inherit nixpkgs system;
      checkFiles = [./.];
      config = {
        tools = {
          deadnix.enable = true;
          nixpkgs-fmt.enable = false;
          alejandra.enable = true;
          statix.enable = true;
        };
      };
    });
  in {
    inherit lib;

    checks = forEachSystem (system: {
      nix-formatter-pack-check = nix-formatter-pack.lib.mkCheck formatterPackArgsPerSystem.${system};
    });

    formatter = forEachSystem (
      system: nix-formatter-pack.lib.mkFormatter formatterPackArgsPerSystem.${system}
    );

    devShells = forAllSystems (pkgs: {
      default = import ./shell.nix {inherit pkgs;};
    });

    # devShells.x86_64-linux.default = pkgs.mkShell {
    #   packages = with pkgs; [
    #     age
    #     sops
    #     rops
    #     git
    #     gh
    #     yazi
    #     ripgrep-all
    #     jq
    #     pciutils
    #     tree
    #     fastfetch
    #     gtop
    #     sbctl
    #     home-manager
    #   ];
    # };

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/ThinkpadNomad/configuration.nix
          ./hosts/profiles/complete.nix
          inputs.stylix.nixosModules.stylix
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nur.modules.nixos.default
          inputs.nixos-cosmic.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.disko.nixosModules.disko
          inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-bitcoin.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              backupFileExtension = "bkp";
              users = {
                michzuerch = {
                  imports = [
                    ./home/michzuerch/home.nix
                  ];
                };
              };
            };
          }
        ];
      };
      ElitebookNomad = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/ElitebookNomad/configuration.nix
          ./hosts/profiles/complete.nix
          inputs.stylix.nixosModules.stylix
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nur.modules.nixos.default
          inputs.nixos-cosmic.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.disko.nixosModules.disko
          # inputs.nix-bitcoin.nixosModules.default
          # inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              backupFileExtension = "bkp";
              users = {
                michzuerch = {
                  imports = [
                    ./home/michzuerch/home.nix
                  ];
                };
              };
            };
          }
        ];
      };

      VM = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/VM/configuration.nix
          ./hosts/profiles/complete.nix
          inputs.stylix.nixosModules.stylix
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nur.modules.nixos.default
          inputs.nixos-cosmic.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.disko.nixosModules.disko
          inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          inputs.nix-bitcoin.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit outputs inputs;
              };
              backupFileExtension = "backup";
              users = {
                michzuerch = {
                  imports = [
                    ./home/michzuerch/home.nix
                  ];
                };
              };
            };
          }
        ];
      };

      installer = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/installer/configuration.nix
        ];
      };
    };
  };
}
