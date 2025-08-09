{ pkgs, inputs, lib, ... }:

let
  pkgs = import inputs.nixpkgs {
    inherit (inputs.hydenix.lib) system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.lib.overlays
      (final: prev: {
        code-cursor = prev.code-cursor.overrideAttrs (old: {
	  version = "1.4.2";
	  src = prev.appimageTools.extract {
	    pname = "cursor";
	    version = "1.4.2";
	    src = prev.fetchurl {
	      url = "https://downloads.cursor.com/production/d01860bc5f5a36b62f8a77cd42578126270db343/linux/x64/Cursor-1.4.2-x86_64.AppImage";
              hash = "sha256-WMZA0CjApcSTup4FLIxxaO7hMMZrJPawYsfCXnFK4EE=";
	    };
	  };
	  sourceRoot = "cursor-1.4.2-extracted/usr/share/cursor";
	});

        userPkgs = import inputs.nixpkgs {
          system = prev.system;
          config.allowUnfree = true;
        };
      })
    ];
  };
in {

  nixpkgs.pkgs = pkgs;

  imports = [
    inputs.hydenix.lib.nixOsModules

    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./gaming.nix
    ./hyprland.nix
    ./network.nix
    ./ollama.nix
    ./sddm.nix
    ./system.nix
    ./user.nix
  ];

  audio.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
  boot.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  network.enable = lib.mkDefault true;
  ollama.enable = lib.mkDefault true;
  sddm.enable = lib.mkDefault true;
  system.enable = lib.mkDefault true;

  hydenix = {
    enable = true;

    audio.enable = false;
    boot.enable = false;
    gaming.enable = false;
    network.enable = false;
    sddm.enable = false;
    system.enable = false;
  };

}
