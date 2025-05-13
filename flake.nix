{
  description = "FrostPhoenix's nixos configuration";

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

  outputs =
    { nixpkgs, self, nvf, ... }@inputs:
    let
      username = "arkatosh";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        #desktop = nixpkgs.lib.nixosSystem {
        #  inherit system;
        # modules = [ ./hosts/desktop ];
        # specialArgs = {
        #   host = "desktop";
        #   inherit self inputs username;
        # };
        #};
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
        #vm = nixpkgs.lib.nixosSystem {
        #  inherit system;
        #  modules = [ ./hosts/vm ];
        #  specialArgs = {
        #    host = "vm";
        #    inherit self inputs username;
        #  };
        #};
      };
    };
  devShells = {
  ${system}.default = pkgs.mkShell {
    packages = [
      (pkgs.python312.withPackages (ps: with ps; [
        numpy
        # optional: add pandas, matplotlib, etc.
      ]))
      pkgs.gcc  # ensures libstdc++.so.6 is available
    ];

    shellHook = ''
      echo "[Lagerbank2024] Python dev environment ready."
      echo "Run with: python3 app.py"
    '';
  };
};

}
