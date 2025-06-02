{ pkgs, lib, config, ... }:

{

  options.boot.enable = lib.mkEnableOption "Enable boot module";

  config = lib.mkIf config.boot.enable {

    hydenix.boot = {
      enable = lib.mkForce true;
      useSystemdBoot = false;
    };

    boot.loader = {
      grub.theme = lib.mkForce "${pkgs.hydenix.grub-retroboot}/share/grub/themes/Retroboot";
      efi.canTouchEfiVariables = lib.mkForce false;
    };

  };
}
