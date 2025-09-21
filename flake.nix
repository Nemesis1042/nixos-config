{
  description = "FrostPhoenix's nixos configuration + CashApp DevShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprland.url = "github:hyprwm/hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    zig.url = "github:mitchellh/zig-overlay";

    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, self, nvf, ... }@inputs:
  let
    username = "arkatosh";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    devShells.${system} = {
      # Python-Umgebung
      default = pkgs.mkShell {
        packages = [
          (pkgs.python312.withPackages (ps: with ps; [
            flask pandas numpy sympy matplotlib requests ipython black scipy jupyter
          ]))
          pkgs.gcc
        ];
        shellHook = ''
          echo "[Lagerbank2024] Python dev environment ready."
          cd /home/arkatosh/Documents/GIT
        '';
      };

      # Selenium-Umgebung
      selenium = pkgs.mkShell {
        packages = [
          (pkgs.python312.withPackages (ps: with ps; [ selenium ]))
          pkgs.chromium
          pkgs.chromedriver
        ];
        shellHook = ''
          echo "[Selenium-Env] Python 3.12 + Selenium environment ready."
        '';
      };

      # CashApp (Electron + React + SQLite)
      cashapp = pkgs.mkShell {
        packages = with pkgs; [
          nodejs_22
          pnpm
          git
          python3
          gcc
          gnumake
          pkg-config
          zlib
          libusb1
          sqlite
        ];
        shellHook = ''
          echo "🛠️ CashApp DevShell bereit"
          echo "Nutze 'pnpm install' um die Node-Abhängigkeiten zu installieren."
        '';
      };
    };

    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/laptop
          nvf.nixosModules.default
        ];
        specialArgs = {
          host = "laptop";
          inherit self inputs username;
        };
      };
    };
  };
}

