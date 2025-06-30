{ pkgs, inputs, lib, ... }:

let
  pkgs = import inputs.nixpkgs {
    inherit (inputs.hydenix.lib) system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.lib.overlays
      (final: prev: {
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
