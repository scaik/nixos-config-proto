{
  description = "Scaik's NixOS Setup";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    hydenix.url = "github:richen604/hydenix";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, ... }@inputs: let

    system = "x86_64-linux";
    userName = "scaik";
    hosts = [
      { hostName = "scaikpc"; stateVersion = "25.05"; }
    ];

    makeSystem = { hostName, stateVersion }: nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs hostName stateVersion userName; };
      modules = [
        ./hardware-configuration.nix
        ./hosts/${hostName}/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.backupFileExtension = "backup";
          home-manager.users.${userName} = import ./hosts/${hostName}/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs stateVersion userName; };
        }
      ];
    };

  in {

    nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      configs // {
        "${host.hostName}" = makeSystem { inherit (host) hostName stateVersion; };
      }
    ) {} hosts;

  };
}
