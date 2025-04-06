{
  description = "A very basic flake";

  # inputs = {
  #   nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  #   home-manager.url = "github:nix-community/home-manager";
  #   home-manager.inputs.nixpkgs.follows = "nixpkgs";
  #   hyprland.url = "github:hyprwm/Hyprland";
  # };


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    #
nixvim = {
      url = "github:nix-community/nixvim";
      # url = "/home/gaetan/perso/nix/nixvim/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    nixy-wallpapers = {
      url = "github:anotherhadi/nixy-wallpapers";
      flake = false;
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    pia = {
      url = "github:Fuwn/pia.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };



  outputs = inputs@{ nixpkgs, ... }: {
# outputs = { nixpkgs, home-manager, hyprland,  ... }@inputs:
  # let
  #   system = "x86_64-linux";
  #   pkgs = import nixpkgs {
  #     inherit system;
  #     config = { allowUnfree = true; };
  #   };
  #   lib = nixpkgs.lib;
  # in
  #
  # {
 nixosConfigurations = {
      jonwick = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
            {
              nixpkgs.overlays =
                [ inputs.hyprpanel.overlay inputs.nur.overlay ];
              _module.args = { inherit inputs; };
            }
            # inputs.nixvim.homeManagerModules.nixvim
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.pia.nixosModules."x86_64-linux".default
          ./configuration.nix
          # home-manager.nixosModules.home-manager
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.users.jonwick = import ./home/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          # }
        ];
      };
    };

	  #  nixosConfigurations = {
	  #    jonwick = lib.nixosSystem {
	  #      inherit system;
	  #     specialArgs = { inherit inputs; }; # allows access to flake inputs in nixos modules
	  #      modules = [
	  #        ./configuration.nix
	  #        # hyprland.homeManagerModules.default
	  #        # {wayland.windowManager.hyprland.enable = true;}
	  #        home-manager.nixosModules.home-manager
	  #      ];
	  #    };
	  #
	  # # Home Manager stuff
	  #  homeManagerConfigurations = {
	  #    hm = home-manager.lib.homeManagerConfiguration {
	  #
	  #      inherit system pkgs;
	  #      username = "jonwick";
	  #      homeDirectory = "/home/jonwick";
	  #      configuration = {
	  #        imports =[
	  #          ];
	  #        };
	  #      };
	  #    };
	  #  };
  };
}
