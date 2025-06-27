{ pkgs, lib, config, ... }:

{

  options.system.enable = lib.mkEnableOption "Enable system module";

  config = lib.mkIf config.system.enable {

    hydenix.hardware.enable = lib.mkForce true;

    environment.systemPackages = with pkgs; [
      neovim # text editor
      jq # json cli
      imagemagick # image tools
      fd # find drop-in replacement
      mesa # opengl implementation
    ];

    environment.variables = {
      NIXOS_OZONE_WL = "1";
      TERMINAL = "kitty";
      EDITOR = "nvim";
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [ "$XDG_BIN_HOME" ];
    };

    services = {
      dbus.enable = true;
      upower.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = { common = { default = [ "gtk" ]; }; };
    };

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.caskaydia-cove
      fira-code
    ];

    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
      ];
    };

  };
}
