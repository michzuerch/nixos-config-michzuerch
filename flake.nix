{
  description = "nixos michzuerch may 2025";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      #url = "github:nix-community/home-manager/release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
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
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
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
    nix-colors,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // inputs.home-manager.lib;
    system = "x86_64-linux"; # change to whatever your system should be
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    inherit lib;
    formatter.${system} = pkgs.alejandra;

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
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
        home-manager
      ];
    };

    nixosConfigurations = {
      ThinkpadNomad = lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/ThinkpadNomad/configuration.nix
          ./hosts/profiles/complete.nix
          # {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nur.modules.nixos.default
          inputs.nix-colors.homeManagerModules.default
          inputs.nixos-cosmic.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.disko.nixosModules.disko
          inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit system outputs inputs;
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
        specialArgs = {
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/ElitebookNomad/configuration.nix
          ./hosts/profiles/complete.nix
          # ./hosts/profiles/debug.nix
          # {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nur.modules.nixos.default
          inputs.nix-colors.homeManagerModules.default
          inputs.nixos-cosmic.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.disko.nixosModules.disko
          inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit system outputs inputs;
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
        specialArgs = {
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/VM/configuration.nix
          ./hosts/profiles/complete.nix
          inputs.nvf.nixosModules.default
          inputs.nix-index-database.nixosModules.nix-index
          inputs.nur.modules.nixos.default
          inputs.nix-colors.homeManagerModules.default
          inputs.nixos-cosmic.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak
          inputs.disko.nixosModules.disko
          inputs.sops-nix.nixosModules.sops
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
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
        specialArgs = {
          inherit inputs outputs system;
        };
        modules = [
          ./hosts/installer/configuration.nix
        ];
      };
    };
  };
}
